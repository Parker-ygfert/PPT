namespace :db do

  desc "更新文章序號"
  task :update_post_serial => :environment do
    
    serial_nil = Post.where(serial: nil)
    
    if serial_nil.count != 0
      puts "-" * 10
      puts "updating serial"

      serial_nil.each do |post|
        post.update(serial: serial_generator(10))
        print "."
      end

      puts "done!"
    puts "-" * 10
    else
      puts "no nil serial post"
    end

  end



  private
  def serial_generator(n)
    arr = [*"a".."z", *"A".."Z", *0..9]
    serial = ""
    n.times do
      serial += arr.sample.to_s
    end
    serial
  end

end