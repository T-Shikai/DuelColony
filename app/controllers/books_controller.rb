class BooksController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @book = Book.new(end_user: current_end_user, topic: @topic)
    if @book.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @book = Book.find_by(end_user: current_end_user, topic: @topic)
    if @book.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end
