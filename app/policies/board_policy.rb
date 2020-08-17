class BoardPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  #* 可以不寫，會沿用上層
  # def new?
  #   create?
  # end

  def create?
    (plan_b_user or admin) or (user.boards.count < 2)
  end
  
end