class Board < ApplicationRecord

  #* 為何表單驗證是在 Model 這邊做?
  validates :title, :intro, presence: true, length: { minimum: 2 }

  def destroy
    update(deleted_at: Time.now)
  end
  
end