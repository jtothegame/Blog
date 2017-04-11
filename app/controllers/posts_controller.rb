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
    @comment = Comment.new
    @comment = Comment.all
    redirect_to home_path
  end

  # def update
  #   if !(can? :edit, @question)
  #     redirect_to root_path, alert: 'access denied'
  #   elsif @question.update(question_params)
  #     redirect_to question_path(@question), notice: 'Question updated'
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   if can? :destroy, @question
  #     @question.destroy
  #     redirect_to questions_path, notice: 'Question Deleted'
  #   else
  #     redirect_to root_path, alert: 'Access Denied'
  #   end
  # end

end
