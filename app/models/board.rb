class Board < ApplicationRecord

  #* 為何表單驗證是在 Model 這邊做?
  validates :title, presence: true, length: { minimum: 2 }

end