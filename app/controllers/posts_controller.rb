class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @topic = @post.topic
    @posts = @topic.posts
    @post_num = 1
    @post.end_user = current_end_user
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = '書き込み失敗'
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(status: 2)
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :topic_id)
  end
end
