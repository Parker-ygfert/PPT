class User < ApplicationRecord
  validates :account,:password, presence: true
end
