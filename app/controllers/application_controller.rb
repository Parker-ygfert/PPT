class ApplicationController < ActionController::Base

  #* 共用設定可以搬到父層
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private
  def not_found
    render file: '/public/404.html', status: 404
  end

end
