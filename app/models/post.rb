class Post < ApplicationRecord
  belongs_to :board

  validates :title, :ip_address, presence: true
end
