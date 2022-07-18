class CommentsController < ApplicationController
  before_action :set_commment, only: %i[edit update destroy]

  def create
    @comment = current_user.comments.create(comment_params)
  end

  def edit
    @board = Board.find(params[:board_id])
  end

  def update
  end

  def destroy
    @comment.destroy!
  end

  private
  
  def set_commment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
