class SendmailJob < ApplicationJob
  queue_as :default

  def perform(post)
    puts "-" * 20
    puts "寄信囉～"
    puts "-" * 20
    PostMailer.with(post: post).poster.deliver_now
  end
end
