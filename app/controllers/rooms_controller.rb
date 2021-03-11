class RoomsController < ApplicationController
  def index
    @rooms = Room.where.not(status: 4)
  end

  def new
    @room = Room.new
    @user_room = UserRoom.new
  end

  def create
    @room = Room.new(room_params)
    @user_room = UserRoom.new(user_room_params)
    if @room.save
      @user_room.room_id = @room.id
      if @user_room.save
        redirect_to rooms_path
      else
        @room.destroy
        flash[:error] = '募集できませんでした'
        render :new
      end
    else
      flash[:error] = @room.errors.full_messages
      render :new
    end
  end

  def cancel
    @room = Room.find(params[:id])
    if @room.update(status: 4)
      flash[:error] = '募集を取り消しました'
      redirect_to rooms_path
    end
  end

  def apply
    @room = Room.find(params[:id])
    if @room.status == 0
      #ゲストによる応募時の処理
      if @room.update(status: 1, guest: current_end_user)
        flash[:error] = '対戦募集に応募しました'
        redirect_to rooms_path
      end
    else
      #ゲストによる応募キャンセルの処理
      #ホストによる応募拒否の処理
      if @room.update(status: 0, guest: @room.host)
        flash[:error] = '応募が取り消されました'
        redirect_to rooms_path
      end
    end
  end

  def accept
    @room = Room.find(params[:id])
    if @room.status == 1
      #ホストによる応募承諾の処理
      if @room.update(status: 2)
        flash[:error] = '対戦チャットが作成されました。'
        redirect_to rooms_path
      end
    elsif @room.status == 2
      #チャットルーム内での対戦中断処理
      if @room.update(status: 5)
        flash[:error] = '対戦が中止されました。'
        redirect_to rooms_path
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def chat
    @room = Room.find(params[:id])
    if @room.status != 2
      redirect_to rooms_path
    else
    end
  end

  private

  def room_params
    params.require(:room).permit(:title, :content).merge(host: current_end_user, guest: current_end_user)
  end

  def user_room_params
    params.require(:user_room).permit(:end_user_id)
  end
end
