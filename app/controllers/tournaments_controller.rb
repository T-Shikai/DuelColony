class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.end_user = current_end_user
    if @tournament.save
      flash[:error] = "大会を公開しました"
      redirect_to tournaments_path
    else
      flash[:error] = "不備あり"
      render :new
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :content, :max)
  end
end
