class TopicsController < ApplicationController
  def index
    case params[:sort]
    when "0"
      sorted_topics = Topic.where(is_private: false).sort{|a,b| b.posts[-1].created_at <=> a.posts[-1].created_at}
    when "1"
      sorted_topics = Topic.where(is_private: false).sort{|a,b| b.posts.count <=> a.posts.count}
    when "2"
      sorted_topics = Topic.where(is_private: false).sort{|a,b| b.books.count <=> a.books.count}
    else
      sorted_topics = Topic.where(is_private: false).sort{|a,b| b.posts[-1].created_at <=> a.posts[-1].created_at}
    end
    @topics = Kaminari.paginate_array(sorted_topics).page(params[:page]).per(10)
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
    @post = Post.new
    case params[:new_posts]
    when "0"
      @posts = @topic.posts.order("id desc").limit(10).sort{|a,b| a.id <=> b.id}
    when "1"
      @posts = @topic.posts
    else
      @posts = @topic.posts.order("id desc").limit(10).sort{|a,b| a.id <=> b.id}
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :is_private)
  end

  def post_params
    params.require(:post).permit(:content, :image)
  end

end
