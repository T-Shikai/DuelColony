class LikesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ban_deleted_user
  
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(end_user: current_end_user, post: @post)
    if @like.save
      render :index
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(end_user: current_end_user, post: @post)
    if @like.destroy
      render :index
    end
  end
end
