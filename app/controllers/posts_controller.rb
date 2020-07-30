class PostsController < ApplicationController

  before_action :find_board, only: [:new, :create]

  def new
    # board = Board.find(params[:board_id])
    #* 先確定看板編號存在
    @post = @board.posts.new
  end
  
  def create
    # board = Board.find(params[:board_id])
    @post = @board.posts.new(post_params)

    if @post.save
      # redirecto_to board_path(board.id), notice: "文章新增成功"
      redirecto_to @board, notice: "文章新增成功"
    else
      render :new
    end
  end



  private
  def find_board
    @board = Board.find(params[:board_id])
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :ip_address)
  end
  
end
