class PostsController < ApplicationController

  before_action :find_board, only: [:new, :create]
  before_action :authenticate_user!, except: [:show]

  def show
    @post = Post.find(params[:id])
    @board = @post.board
    @comment = @post.comments.new
    @comments = @post.comments.order(created_at: :desc)
  end

  
  def new
    # board = Board.find(params[:board_id])
    #* 先確定看板編號存在
    @post = @board.posts.new
  end
  
  def create
    # board = Board.find(params[:board_id])
    
    @post = @board.posts.new(post_params) # if authenticate_user!
    # @post.user = current_user

    if @post.save
      # PostMailer.with(post: @post).poster.deliver_later
      # SendmailJob.set(wait: 10.seconds).perform_later(@post)
      
      # redirecto_to board_path(board.id), notice: "文章新增成功"
      redirect_to @board, notice: "文章新增成功"
    else
      render :new
    end
  end


  def edit
    # @post = Post.find_by(id: params[:id], user: current_user)
    @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "修改成功"
    else
      render :edit
    end
  end


  private
  def find_board
    @board = Board.find(params[:board_id])
  end
  
  def post_params
    params.require(:post)
          .permit(:title, :content, :ip_address, :photo, :hello)
          .merge(user: current_user)
  end
  
end
