class ChatChannel < ApplicationCable::Channel

  # def subscribed
  #   stream_from "chat_#{params[:room]}"
  # end
  
  # def receive(data)
  #   puts "-" * 20
  #   puts "data output"
  #   puts data
  #   puts "-" * 20
  #   ActionCable.server.broadcast("chat_#{params[:room]}", data)
  # end
  
end