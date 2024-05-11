class ChosePsController < ApplicationController
  before_action :set_chose_p, only: %i[ show edit update destroy ]
  before_action :check_provider_role, only: [:new, :create]

  # GET /chose_ps or /chose_ps.json
  def index
    @chose_ps = current_user.chose_ps
  end

  # GET /chose_ps/1 or /chose_ps/1.json
  def show
  end

  # GET /chose_ps/new
  def new
    @service = Service.find(params[:service_id])
    if current_user.chose_ps.exists?(service_id: @service.id)
      @chose_p = current_user.chose_ps.find_by(service_id: @service.id)
      if @chose_p.choice == 'I will' || @chose_p.choice == 'I won\'t'
        render 'edit'
      else
        redirect_to @chose_p, notice: "You have already made a selection for this service."
      end
    else
      @chose_p = ChoseP.new(service_id: @service.id, user_id: current_user.id)
    end
  end

  # GET /chose_ps/1/edit
  def edit
  end

  # POST /chose_ps or /chose_ps.json
  def create
    @chose_p = ChoseP.new(chose_p_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @chose_p.save
        format.html { redirect_to chose_p_url(@chose_p), notice: "Chose p was successfully created." }
        format.json { render :show, status: :created, location: @chose_p }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chose_p.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chose_ps/1 or /chose_ps/1.json
  def update
    respond_to do |format|
      if @chose_p.update(chose_p_params)
        format.html { redirect_to chose_p_url(@chose_p), notice: "Chose p was successfully updated." }
        format.json { render :show, status: :ok, location: @chose_p }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chose_p.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chose_ps/1 or /chose_ps/1.json
  def destroy
    @chose_p.destroy!

    respond_to do |format|
      format.html { redirect_to chose_ps_url, notice: "Chose p was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chose_p
    @chose_p = ChoseP.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chose_p_params
    params.require(:chose_p).permit(:service_id, :choice)
  end

  # Check if the current user has the "provider" role
  def check_provider_role
    unless current_user && current_user.role == "provider"
      redirect_to root_path, alert: "Only providers can use ChoseP."
    end
  end
end
