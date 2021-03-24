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

  def update
    @tournament = Tournament.find(params[:id])
    case @tournament.status
    when 0
      if @tournament.update(status: 1)
        @tournament.participants.each do |part|
          part.update(status: 1)
        end
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def update_info
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)
      flash[:error] = "大会情報を変更しました"
      redirect_to tournaments_path
    else
      flash[:error] = "変更できませんでした"
      render :show
    end
  end

  def finish
    @tournament = Tournament.find(params[:id])
    if @tournament.update(finish_params)
      @tournament.update(status: 2)
      #出席未確定の参加者を全員出席扱いにする
      @tournament.participants.each do |part|
        if part.status == 1
          part.update(status: 2)
        end
      end
      flash[:error] = "大会が終了しました"
      redirect_to tournaments_path
    end

  end

  def destroy
    @tournament = Tournament.find(params[:id])
    if @tournament.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end
  
  def result
    @tournament = Tournament.find(params[:id])
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :content, :max)
  end

  def finish_params
    params.require(:tournament).permit(:result)
  end
end
