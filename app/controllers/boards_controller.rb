class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user)
  end

  # 掲示板新規作成フォーム
  def new
    @board = Board.new
  end

  # 掲示板新規作成フォームから受け取った値を処理
  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path, success: t('.board_create')
    else
      flash.now[:danger] = t('.not_board_create')
      render :new
    end
  end

  # Strong Parameter
  def board_params
    params.require(:board).permit(
        :title,
        :body,
        # :image,
        # :image_cache
    )
  end
end
