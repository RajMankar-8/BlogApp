class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_path(@comment.post), notice: "Comment are created Successfully"
    else
      redirect_to post_path(@comment.post), status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_email)
  end
end
