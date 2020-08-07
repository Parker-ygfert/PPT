class Board < ApplicationRecord
  # acts_as_paranoid

  #* 為何表單驗證是在 Model 這邊做?
  validates :title, :intro, presence: true, length: { minimum: 2 }

  has_many :posts, dependent: :destroy #* 預設 foreign_key: "board_id"
  #* has_many 會做出關聯兩個 Model 的方法

  has_many :board_masters
  has_many :users, through: :board_masters
  
  has_many :favorite_boards
  has_many :my_users, through: :favorite_boards, source: :user

  # default_scope { where(deleted_at: nil) }
  #* 為所有搜尋都加上這條限制
  #* unscope(:where)，擺脫預設限制

  # scope :available, -> { where(deleted_at: nil) }
  #* 可以將後面的 lambda 塞給 scope 呼叫，讓 controller 可以使用 available 方法執行

  #* 自行定義類別方法給 controller 用
  # def self.available
  #   where(deleted_at: nil)
  # end
  
  # def destroy
  #   update(deleted_at: Time.now)
  # end
  
end