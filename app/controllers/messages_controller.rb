class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    @room = message.room
    @messages = @room.messages
    @message = Message.new
    if message.save
      flash[:error] = 'メッセージが送信されました。'
      render :index
    else
    end
  end

  def update
    message = Message.find(params[:id])
    @room = message.room
    @messages = @room.messages
    @message = Message.new
    if message.update(is_deleted: true)
      flash[:error] = 'メッセージが削除されました。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id, :end_user_id)
  end

end
