class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_no_profile, only: [:index]

  # GET /profiles or /profiles.json
  def index
    @profile = current_user.profile
    if current_user.role == "provider"
      @payments_for_posters = {}
      current_user.posters.each do |poster|
        @payments_for_posters[poster] = poster.payments.includes(:user)
      end
    end
    @payments = current_user.payments.includes(:poster)
  end


  # GET /profiles/1 or /profiles/1.json
  def show
    # @user = @profile.user
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :index, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :index, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy!

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # DELETE /profiles/1/clear_avatar
  def clear_avatar
    @profile = Profile.find(params[:id])
    @profile.remove_avatar! if @profile.avatar.present?
    redirect_to @profile, notice: 'Avatar was successfully cleared.'
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def redirect_if_no_profile
    redirect_to new_profile_path if current_user.profile.nil?
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:title, :surname, :parental, :date_of_birth, :sex, :telephone, :currency, :avatar)
  end
end
