class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:body, :user)
    @comment = Comment.new(comment_params)
    @comment.post = @post

    # @comment = @post.comments.build(comment_params) is the same as doing @comment.post = @post

    if @comment.save
      redirect_to post_path(@comment.post), notice: 'Comment Created!'
    else
      redirect_to post_path(@post), alert: 'Something Went Wrong!'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post), notice: 'Comment deleted!'
  end

end
