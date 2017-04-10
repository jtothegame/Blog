class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to posts_path(@post)
    else
      flash.now[:alert] = 'Please fix the errors'
      render :new
    end
  end
end
