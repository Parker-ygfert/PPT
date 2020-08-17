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
    if plan_a_user
      plan_a_user.boards.count < 2
    elsif plan_b_user or admin
      true
    else
      false
    end
  end
  
end