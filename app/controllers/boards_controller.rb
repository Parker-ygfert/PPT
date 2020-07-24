class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end
  
  def new
    @board = Board.new
  end

  def create
    # @board = Board.new(params[:board])
    #* 參數未經過清洗會被擋住

    @board = Board.new(board_params)

    if @board.save
      # flash[:notice] = "新增成功"
      redirect_to boards_path, notice: "新增成功"
    else
      render :new
    end

    # Board.creat(title: params[:tilte], intro: params[:intro])
    # redirect_to '/'
    #* 手刻表單要自己抓出參數
    #* form helper 自動生成 name="board[title]" 會整合成一包
    #* params => {"board" => {"title" => "aaa", "intro" => "bbb"}}
    #* 這樣抓參數可以直接用 params[:board]
  end

  private
  def board_params
    #* Strong Parameters
    params.require(:board).permit(:title, :intro)
  end
  
end
