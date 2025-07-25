class PostsController < ApplicationController
  before_action :authenticate_user! 


  def index
    if current_user.admin?
      @posts = Post.all
    else
      @posts = Post.where(teacher_id: current_user.id)
    end
  end

  def new
    @post = Post.new
    @teachers = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_parameter)
    if @post.save
      redirect_to posts_path, notice: "投稿が保存されました"
    else
      render :new
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_parameter)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  


  private
  def post_parameter
    params.require(:post).permit(:title, :content, :start_time ,:teacher_id)
  end
  
end
