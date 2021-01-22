class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to accent_path(params[:accent_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, accent_id: params[:accent_id])
  end
end
