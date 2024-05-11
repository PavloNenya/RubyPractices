class ChoseUsController < ApplicationController
  before_action :set_chose_u, only: %i[ show edit update destroy ]
  before_action :check_client_role, only: [:new, :create]

  # GET /chose_us or /chose_us.json
  def index
    @chose_us = current_user.chose_us
  end

  # GET /chose_us/1 or /chose_us/1.json
  def show
  end

  # GET /chose_us/new
  def new
    @service = Service.find(params[:service_id])
    # Check if the user has already chosen this service
    if current_user.chose_us.exists?(service_id: @service.id)
      @chose_u = current_user.chose_us.find_by(service_id: @service.id)
      # Allow editing if the current choice is 'I will' or 'I won't'
      if @chose_u.choice == 'I will' || @chose_u.choice == 'I won\'t'
        render 'edit'
      else
        redirect_to @chose_u, notice: "You have already made a selection for this service."
      end
    else
      @chose_u = ChoseU.new(service_id: @service.id)
    end
  end


  # GET /chose_us/1/edit
  def edit
  end

  # POST /chose_us or /chose_us.json
  def create
    @chose_u = current_user.chose_us.new(chose_u_params)

    respond_to do |format|
      if @chose_u.save
        format.html { redirect_to chose_u_url(@chose_u), notice: "Chose u was successfully created." }
        format.json { render :show, status: :created, location: @chose_u }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chose_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chose_us/1 or /chose_us/1.json
  def update
    respond_to do |format|
      if @chose_u.update(chose_u_params)
        format.html { redirect_to chose_u_url(@chose_u), notice: "Chose u was successfully updated." }
        format.json { render :show, status: :ok, location: @chose_u }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chose_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chose_us/1 or /chose_us/1.json
  def destroy
    @chose_u.destroy!

    respond_to do |format|
      format.html { redirect_to chose_us_url, notice: "Chose u was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chose_u
    @chose_u = current_user.chose_us.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chose_u_params
    params.require(:chose_u).permit(:service_id, :choice)
  end

  # Check if the current user has the "client" role
  def check_client_role
    unless current_user && current_user.role == "client"
      redirect_to root_path, alert: "Only clients can create ChoseU records."
    end
  end
end
