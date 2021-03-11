class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    @room = message.room
    @messages = @room.messages
    @message = Message.new
    if message.save
      flash[:error] = 'メッセージが送信されました。'
      redirect_to chat_room_path(@room)
    else
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(is_deleted: true)
      flash[:error] = 'メッセージが削除されました。'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.permit(:content, :room_id, :end_user_id)
  end

end
