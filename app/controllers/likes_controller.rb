class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(end_user: current_end_user, post: @post)
    if @like.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(end_user: current_end_user, post: @post)
    if @like.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end
