class BoardsController < ApplicationController
  before_action :set_board, only: %i[show]
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      redirect_to boards_path, success: (t"defaults.message.created", item: Board.model_name.human)
    else
      flash.now[:danger] = (t"defaults.message.not_created", item: Board.model_name.human)
      render :new
    end 
  end

  def show
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end

end
