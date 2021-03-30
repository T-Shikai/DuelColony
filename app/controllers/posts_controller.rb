class PostsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ban_deleted_user

  def create
    post = Post.new(post_params)
    @topic = post.topic
    @post = Post.new
    post.end_user = current_end_user
    if post.save
      @posts = @topic.posts.order("id desc").limit(10).sort { |a, b| a.id <=> b.id }
      render :index
    else
      flash[:error] = '書き込みができませんでした。'
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    # 「削除されました」と表示
    post = Post.find(params[:id])
    @topic = post.topic
    @posts = @topic.posts
    @post_num = 1
    @post = Post.new
    if post.update(status: 2)
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :topic_id)
  end
end
