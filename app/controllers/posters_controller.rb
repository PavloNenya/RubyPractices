class PostersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_poster, only: [:show, :edit, :update, :destroy, :add_to_favorites, :schedule, :check_busy_day]
  before_action :check_provider_role, only: [:new, :create]

  # GET /posters or /posters.json
  def index
    @posters = Poster.includes(:service, :reviews, :payments)

    if params[:search].present?
      @posters = @posters.joins(:service).where("services.name LIKE ?", "#{params[:search]}%")
    end

    if params[:sort] == 'average_rating'
      @posters = @posters.left_joins(:reviews)
                         .group(:id)
                         .order(Arel.sql('AVG(reviews.rating) DESC NULLS LAST'))
    elsif params[:sort] == 'num_reviews'
      @posters = @posters.left_joins(:reviews)
                         .group(:id)
                         .order('COUNT(reviews.id) DESC')
    elsif params[:sort] == 'num_dates'
      @posters = @posters.left_joins(:payments)
                         .group(:id)
                         .order(Arel.sql('COUNT(DISTINCT payments.date) DESC'))
    end
  end

  # GET /posters/1 or /posters/1.json
  def show
    @profile = @poster.user.profile if @poster.user&.profile.present?
    @payments = @poster.payments
    @average_rating = @poster.reviews.average(:rating)
  end

  # GET /posters/new
  def new
    @poster = Poster.new
    @poster.user_id = current_user.id if current_user
  end

  # GET /posters/1/edit
  def edit
  end

  # POST /posters or /posters.json
  def create
    @poster = Poster.new(poster_params)
    @poster.user_id = current_user.id if current_user

    respond_to do |format|
      if @poster.save
        format.html { redirect_to poster_url(@poster), notice: "Poster was successfully created." }
        format.json { render :show, status: :created, location: @poster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posters/1 or /posters/1.json
  def update
    respond_to do |format|
      if @poster.update(poster_params)
        format.html { redirect_to poster_url(@poster), notice: "Poster was successfully updated." }
        format.json { render :show, status: :ok, location: @poster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posters/1 or /posters/1.json
  def destroy
    @poster.destroy!

    respond_to do |format|
      format.html { redirect_to posters_url, notice: "Poster was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Add to favorites
  def add_to_favorites
    if current_user.favorites.where(poster_id: @poster.id).exists?
      redirect_to @poster, alert: "You have already added this poster to favorites."
    else
      current_user.favorites.create(poster_id: @poster.id)
      redirect_to @poster, notice: "Poster was added to favorites."
    end
  end

  # View schedule for a poster
  def schedule
    @payments = @poster.payments
  end

  # Check if a day is busy for a poster
  def check_busy_day
    @date = Date.today
    @is_busy = @poster.busy_day?(@date)
  end
  def clear_picture
    @poster = Poster.find(params[:id])
    @poster.remove_picture! if @poster.picture.present?
    redirect_to @poster, notice: 'Picture was successfully cleared.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_poster
    @poster = Poster.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def poster_params
    params.require(:poster).permit(:name, :user_id, :service_id, :price, :description, :picture)
  end

  # Check if the current user has the provider role
  def check_provider_role
    unless current_user && current_user.role == "provider"
      redirect_to root_path, alert: "Only providers can create posters."
    end
  end
end
