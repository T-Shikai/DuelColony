class RoomsController < ApplicationController
  def index
    @rooms = Room.where(status: 0)

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
      flash[:error] = '募集できませんでした'
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

  private

  def room_params
    params.require(:room).permit(:title, :content)
  end

  def user_room_params
    params.require(:user_room).permit(:end_user_id)
  end
end
