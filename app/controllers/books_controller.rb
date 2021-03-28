class BooksController < ApplicationController
  before_action :authenticate_end_user!
  
  def create
    @topic = Topic.find(params[:topic_id])
    @book = Book.new(end_user: current_end_user, topic: @topic)
    if @book.save
      render :index
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @book = Book.find_by(end_user: current_end_user, topic: @topic)
    if @book.destroy
      render :index
    end
  end
end
