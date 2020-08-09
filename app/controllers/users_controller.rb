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
      sign_in_user(@user)
      #* 去首頁
      redirect_to root_path, notice: "會員註冊成功"
    else
      flash[:notice] = "請完成資料填寫"
      render :sign_up
    end
  end

  def sign_out
    sign_out_user
    redirect_to root_path, notice: "您已登出，掰掰掰掰"
  end


  def sign_in
    @user = User.new
    sign_in_user(@user)
  end

  def login
    #* 因為 login 方法已有做參數輸入檢查，所以可以少做一步檢查
    # if user_params[:account] and user_params[:password]
      user = User.new.login(user_params)
      
      if user
        sign_in_user(user)
        redirect_to root_path, notice: "歡迎光臨 批批踢"
      else
        redirect_to sign_in_users_path, notice: "帳號或密碼輸入錯誤"
      end
    # else
    #   redirect_to sign_in_users_path, notice: "帳號或密碼輸入錯誤"
    # end
  end



  private
  def user_params
    params.require(:user).permit(:account, :password, :nickname, :email)
  end

  def sign_in_user(user)
    session[:user_token] = user.id
  end

  def sign_out_user
    session[:user_token] = nil
  end
  
end
