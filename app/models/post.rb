class Post < ApplicationRecord
  belongs_to :board

  validates :title, presence: true
  # validates :serial, uniqueness: true { scope: :abc, message: "abc"}
  #* 可以增加 scope 同時比對另一個欄目
  # validates :serial, uniqueness: true, allow_nil: true
  #* 用 allow_nil: true 是鴕鳥心態
  validates :serial, uniqueness: true, allow_nil: true
  validates :ip_address, presence: true



  before_create :create_serail

  private
  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    arr = [*"a".."z", *"A".."Z", *0..9]
    serial = ""
    n.times do
      serial += arr.sample.to_s
    end
    serial
  end
end
