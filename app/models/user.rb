class User < ApplicationRecord

  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :posts
  has_many :comments
  
  has_many :board_masters
  has_many :boards, through: :board_masters

  has_many :favorite_boards
  has_many :my_boards, through: :favorite_boards, source: :board


  before_create :encrypt_password

  #* keyword argument
  # def self.login(account:, password:)
  def login(options)
    if options[:account] and options[:password]  
      User.find_by(account: options[:account],
              password: bigbang(options[:password]))
              # password: Digest::SHA1.hexdigest("x#{options[:password]}y"))
    end
  end

  def toggle_favorite(board)
    if my_boards.exists?(board.id)
      my_boards.destroy(board)
    else
      my_boards << board
    end
  end
  
  
  private
  def encrypt_password
    # self.password = bigbang(self.password)
    #* 右方的 password 方法可拿掉 self
    self.password = bigbang(password)
  end

  def bigbang(string)
    string = "x#{string}y"
    Digest::SHA1.hexdigest(string)
  end
  
end


