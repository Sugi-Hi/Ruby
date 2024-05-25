colors = ["あか", "あお", "きいろ", "みどり", "しろ", "くろ", "むらさき"]

colors.each_with_index do |color,index|
  puts "(#{index+1})色: #{color}"
end

favorite_colors = []

puts "Please input your favorite color number from 1 to 7!(What's your favorite color?)"
input_num = gets.to_i
favorite_colors << colors[input_num-1]

favorite_color 

while true do
  exit
end