class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(tournament_params)
    if @participant.save
      if @participant.tournament.participants.count > @participant.tournament.max
        @participant.destroy
        flash[:error] = "参加人数がいっぱいです"
        redirect_back(fallback_location: root_path)
      else
        flash[:error] = "参加しました"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:error] = @participant.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    if @participant.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @participant = Participant.find(params[:id])
    @participant.update(status: params[:attend].to_i)
    redirect_back(fallback_location: root_path)
  end

  private

  def tournament_params
    params.require(:participant).permit(:tournament_id, :end_user_id)
  end
end
