class UsersController < ApplicationController

  def sign_up
  end

  def sign_in
  end


  
  def new
    @user = User.new
  end

  def create
    
    #! @user = User.new(params[:user])
    #* new 的時候無法寫入是因為參數未經過清洗會被擋住

    @user = User.new(user_params)

    # debugger
    if @user.save
      redirect_to users_path, notice: "新增成功"
    else
      flash[:notice] = "請完成資料填寫"
      render :new
    end

  end



  private
  def user_params
    params.require(:user).permit(:account, :password, :name, :email, :age, :born_date)
  end
  
end
