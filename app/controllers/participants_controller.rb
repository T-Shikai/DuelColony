class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new
    @participant.tournament_id = params[:tour_id]
    @participant.end_user = current_end_user
    if @participant.save
      if @participant.tournament.paticipants.count > @participant.tournament.max
        @participants.destroy
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
    @paticipant = Participant.find(params[:id])
    if @participant.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @paticipant = Participant.find(params[:id])
    @participant.update(status: params[:attend])
  end

  private

  def tournament_params
    params.require(:participant).merge(tournament_id: params[:tournament_id])
  end
end
