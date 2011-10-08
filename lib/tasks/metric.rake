namespace :metric do
  task :new_task => :turn_off_alarm do
    puts "Turned off alarm. Would have liked 5 more minutes, though."
    puts "Showing all posts"
    puts Post.all.inspect
  end
end