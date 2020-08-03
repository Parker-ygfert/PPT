class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create
    #! @user = User.new(params[:user])
    #* new 的時候無法寫入是因為參數未經過清洗會被擋住

    @user = User.new(user_params)
    
    if @user.save
      #* 登入
      session[:user_token] = @user.id
      #* 去首頁
      redirect_to root_path, notice: "會員註冊成功"
    else
      flash[:notice] = "請完成資料填寫"
      render :sign_up
    end
  end

  def sign_in
  end



  private
  def user_params
    params.require(:user).permit(:account, :password, :nickname, :email)
  end
  
end
