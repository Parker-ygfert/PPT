class Board < ApplicationRecord
  acts_as_paranoid

  #* 為何表單驗證是在 Model 這邊做?
  validates :title, :intro, presence: true, length: { minimum: 2 }

  has_many :articles

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