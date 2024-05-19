class VotesController < ApplicationController
  before_action :set_vote, only: %i[ show edit update destroy ]

  # GET /votes or /votes.json
  def index
    @votes = current_user.votes
  end

  # GET /votes/1 or /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  def create
    # Find if the user has already voted for a poster with the same profile
    existing_vote = current_user.votes.find_by(profile_id: params[:vote][:profile_id])

    if existing_vote
      # Update the existing vote if the profile matches but the poster is different
      @vote = existing_vote
      @vote.update(vote_params)
      action = "updated"
    else
      # Create a new vote
      @vote = Vote.new(vote_params)
      # Set user_id from current user
      @vote.user_id = current_user.id if current_user

      # Automatically assign poster_id if not provided
      if @vote.poster_id.blank? && @vote.profile_id.present?
        user_id = Profile.find(@vote.profile_id).user_id
        posters = Poster.where(user_id: user_id)
        if posters.any?
          @vote.poster_id = posters.first.id
        else
          @vote.errors.add(:poster, "must exist")
        end
      end

      action = "created"
    end

    respond_to do |format|
      if @vote.errors.empty? && @vote.save
        format.html { redirect_to vote_url(@vote), notice: "Vote was successfully #{action}." }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /votes/1 or /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to vote_url(@vote), notice: "Vote was successfully updated." }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1 or /votes/1.json
  def destroy
    @vote.destroy!

    respond_to do |format|
      format.html { redirect_to votes_url, notice: "Vote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = Vote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vote_params
    params.require(:vote).permit(:user_id, :profile_id, :poster_id)
  end

end
