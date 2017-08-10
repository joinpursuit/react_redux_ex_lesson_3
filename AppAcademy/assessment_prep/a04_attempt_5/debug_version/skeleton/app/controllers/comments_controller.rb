class CommentsController < ApplicationController
  before_filter :require_signed_in!

  def create
    comment = Comment.new(comment_params)
    comment.user_id = @current_user.id
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to link_url(comment)
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    comment.destroy
    redirect_to link_url(comment.link_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :id)
  end
end
