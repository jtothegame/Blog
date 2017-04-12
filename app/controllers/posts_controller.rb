class PostsController < ApplicationController
  # before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :body, :image)
    @post = Post.new (post_params)
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

  # def update
  #   if !(can? :edit, @post)
  #     redirect_to root_path, alert: 'access denied'
  #   elsif @post.update(post_params)
  #     redirect_to post_path(@post), notice: 'Post updated'
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   if can? :destroy, @post
  #     @post.destroy
  #     redirect_to posts_path, notice: 'Post Deleted'
  #   else
  #     redirect_to root_path, alert: 'Access Denied'
  #   end
  # end

end
