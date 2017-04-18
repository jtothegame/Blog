class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @last_post = Post.last
    @posts = Post.offset(1).limit(15).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :body, :image)
    @post = Post.new (post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Please fix the errors'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit

    redirect_to root_path, alert: 'Access Denied' unless can? :edit, @post
  end

  def update
    @post = Post.find params[:id]
    post_params = params.require(:post).permit([:title, :body, :image, :id])

    if !(can? :edit, @post)
      redirect_to root_path, alert: 'Access Denied'
    elsif @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated'
    else
      render :edit
    end
  end

  def destroy
    if (can? :destroy, @post)
      @post.destroy
      redirect_to root_path, notice: 'Post Deleted'
    else
      redirect_to root_path, alert: 'Access Denied'
    end
  end

  private

  def find_post
    @post = Post.find params[:id]
  end
    
  def post_params
    post_params = params.require(:post).permit([:title, :body, :image, :id])
  end

end
