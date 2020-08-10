module UsersHelper

  #* 移至 ApplicationController，讓 View Helper 只處理跟 Model 無關的資料轉換
  # def user_signed_in?
  #   session[:user_token]
  # end

  # def current_user
  #   User.find(session[:user_token]) if user_signed_in?
  # end

  def display_author(post)
    if post.user
      post.user.account
    else
      "-"
    end
  end
  
    
end