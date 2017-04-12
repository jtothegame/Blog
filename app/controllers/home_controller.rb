class HomeController < ApplicationController

  def index
    @posts = Post.offset(1).limit(15).order('created_at DESC')
    @last_post = Post.last
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private

  def post_params
    post_params = params.require(:post).permit([:title, :body, :image, :id])
  end

end
