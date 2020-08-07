class ApplicationController < ActionController::Base

  # include UsersHelper
  #* 寫在 View Helper，Controller include

  helper_method :user_signed_in?, :current_user
  #* 寫在 Controller, 丟給 View Helper 用，跟 Model 有關的給 Controller 處理

  #* 共用設定可以搬到父層
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # before_action :find_user
  #* 移到 Users View Helper

  private
  # def find_user
  #   if session[:user_token]
  #     @current_user = User.find(session[:user_token])
  #   end
  # end

  def not_found
    render file: '/public/404.html', status: 404, layout: false
  end

  def user_signed_in?
    # session[:user_token]
    current_user != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_token]) # if user_signed_in?
  end

  def authenticate_user!
    redirect_to root_path, notice: "請先登入會員" unless user_signed_in?
  end

end
