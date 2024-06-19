ride_count = 0
friends = []
friend = {}

puts "お友達は何人いますか？"
friends_number = gets.to_i


friends_number.times do |fn|
  puts "--------------------------"
  puts "お友達#{fn+1}人目"
  puts "お友達の名前は？"
  friend[:name] = gets.chomp
  puts "お友達の身長は？"
  friend[:height] = gets.to_i
  friends << friend

  if friend[:height] >= 130
    puts "#{friend[:name]}くんは乗車できます"
    ride_count += 1
  else
    puts "#{friend[:name]}くんは乗車できません！"
  end

end


puts "乗車するのは#{ride_count}人です"