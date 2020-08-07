class BoardsController < ApplicationController

  #* ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # def not_found
  #   render file: '/public/404.html', status: 404
  # end

  before_action :find_board, only: [:show, :edit, :update, :destroy, :favorite]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @boards = Board.where(deleted_at: nil)
    @boards = Board.all
    @location = "看板列表"
  end

  def show
    # params[:id]

    #* SELECT * FROM board WHERE id = ?
    # Board.where(id: params[:id])

    # Board.find(params[:id])
    #* 如果找不到 id 會出現 RecordNotFound
    
    # Board.find_by(id: params[:id])
    #* 如果找不到 id 只會回傳 nil

    # begin
      # @board = Board.find(params[:id])
    # rescue
      # render file: '/public/404.html', status: 404 #* 宣告 404 狀態給瀏覽器看
    # end

    @posts = @board.posts.includes(:user)
  end

  def favorite
    current_user.toggle_favorite(@board)
    # current_user.my_boards << @board unless current_user.my_boards.include?(@board)
    redirect_to favorites_path, notice: "看板已加入最愛"
  end


  def new
    #* 把檢查拉到 before_action
    # if user_signed_in?
      @board = Board.new
    # else
    #   redirect_to root_path, notice: "請先登入會員"
    # end
  end

  def create
    # @board = Board.new(params[:board])
    #* 參數未經過清洗會被擋住

    @board = Board.new(board_params)

    if @board.save
      # flash[:notice] = "新增成功"
      redirect_to boards_path, notice: "新增成功"
    else
      # flash[:notice] = "請重寫"
      render :new
    end

    # Board.creat(title: params[:tilte], intro: params[:intro])
    # redirect_to '/'
    #* 手刻表單要自己抓出參數
    #* form helper 自動生成 name="board[title]" 會整合成一包
    #* params => {"board" => {"title" => "aaa", "intro" => "bbb"}}
    #* 這樣抓參數可以直接用 params[:board]
  end

  def edit
    # @board = Board.find(params[:id])
  end

  def update
    # @board = Board.find(params[:id])

    if @board.update(board_params)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    # @board = Board.find(params[:id])
    @board.destroy
    # @board.update(deleted_at: Time.now)
    #* 自己建立一個 destroy 方法 override
    redirect_to boards_path, notice: "刪除成功"
  end

  

  private
  def find_board
    @board = Board.find(params[:id])
  end
  
  def board_params
    #* Strong Parameters
    params.require(:board).permit(:title, :intro)
  end
  
end
