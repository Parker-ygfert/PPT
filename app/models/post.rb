class Post < ApplicationRecord
  belongs_to :board

  validates :title, :board_id, :ip_address, presence: true
end
