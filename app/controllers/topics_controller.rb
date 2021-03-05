class TopicsController < ApplicationController
  def index
    @topics = Topic.where(is_private: false)
  end

  def new
    @topic = Topic.new
    @post = Post.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.end_user = current_end_user
    @post = Post.new(post_params)
    @post.end_user = current_end_user
    if @topic.save
      @post.topic_id = @topic.id
      if @post.save
        redirect_to topics_path
      else
        @topic.destroy
        flash[:error] = '書き込み失敗'
        render :new
      end
    else
      flash[:error] = 'スレッド作成失敗'
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @post_num = 1
    @post = Post.new
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :is_private)
  end

  def post_params
    params.require(:post).permit(:content, :image)
  end

end
