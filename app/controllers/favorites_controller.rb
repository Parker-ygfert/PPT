class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @boards = current_user.my_boards
  end

  def update
  end
  
  def destroy
  end
  
end