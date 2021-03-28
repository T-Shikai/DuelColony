class RoomsController < ApplicationController
  before_action :authenticate_end_user!

  def index
    case params[:devide]
    when "0"
      @rooms = Room.page(params[:page]).per(10).where(status: 0).order('id desc')
    when "1"
      @rooms = Room.page(params[:page]).per(10).where(status: [1,2]).order('id desc')
    when "2"
      @rooms = Room.page(params[:page]).per(10).where(status: [3,5]).order('id desc')
    when "3"
      @rooms = Room.page(params[:page]).per(10).where(status: [0,1,2]).where('host_id = ? or guest_id = ?', current_end_user, current_end_user).order('id desc')
    else
      @rooms = Room.page(params[:page]).per(10).where(status: 0).order('id desc')
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:error] = '募集を作成しました'
      redirect_to rooms_path
    else
      flash[:error] = '募集できませんでした'
      render :new
    end
  end

  def cancel
    @room = Room.find(params[:id])
    @rooms = Room.where.not(status: 4)
    if @room.update(status: 4)
      render :status
    end
  end

  def apply
    @room = Room.find(params[:id])
    @rooms = Room.where.not(status: 4)
    if @room.status == 0
      #ゲストによる応募時の処理
      if @room.update(status: 1, guest: current_end_user)
        render :status
      end
    else
      #ゲストによる応募キャンセルの処理
      #ホストによる応募拒否の処理
      if @room.update(status: 0, guest: @room.host)
        render :status
      end
    end
  end

  def accept
    @room = Room.find(params[:id])
    @rooms = Room.where.not(status: 4)
    if @room.status == 1
      #ホストによる応募承諾の処理
      if @room.update(status: 2)
        render :status
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
    #既読となり通知が出なくなる
    @notices = current_end_user.passive_notifications.where(room_id: @room.id)
    @notices.each do |notice|
      notice.update(checked: true)
    end
    #対戦成立後にのみチャットが存在
    if @room.status != 2 && @room.status != 3 && @room.status != 5
      redirect_to rooms_path
    else
      @messages = @room.messages
      @message = Message.new
    end
  end

  def finish
    @room = Room.find(params[:id])
    case @room.finishing
    when 0
      if @room.update(finishing: current_end_user.id)
        render :finish
      end
    when current_end_user.id
      if @room.update(finishing: 0)
        render :finish
      end
    else
      #両者が合意すると対戦終了
      if @room.update(status: 3)
        redirect_to rooms_path
      end
    end

  end

  private

  def room_params
    params.require(:room).permit(:title, :content).merge(host: current_end_user, guest: current_end_user)
  end
end
