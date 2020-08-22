module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :current_user
 
    # def connect
    #   puts "-" * 20
    #   puts "where am I?"
    #   puts "-" * 20
    #   self.current_user = find_verified_user
    #   puts "-" * 20
    #   puts "#{self.current_user}"
    #   puts "-" * 20
    # end
 
    # private
    # def find_verified_user
    #   if verified_user = User.find_by(id: session[:user_token])
    #     puts "-" * 20
    #     puts "verified? YES!"
    #     puts "-" * 20
    #     verified_user
    #   else
    #     puts "-" * 20
    #     puts "verified? NO!"
    #     puts "-" * 20
    #     reject_unauthorized_connection
    #   end
    # end
  end
end
