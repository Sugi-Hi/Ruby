colors = ["あか", "あお", "きいろ", "みどり", "しろ", "くろ", "むらさき"]

puts "The colors of first lists."
colors.each_with_index do |color,index|
  puts "(#{index+1})色: #{color}"
end

favorite_colors = []

while true do
  puts "Please input your favorite color number from 1 to 7!(What's your favorite color?)"
  input_num = gets.to_i

  if (input_num > 0) && (input_num <= 7)
    favorite_colors << colors[input_num-1]
    
    if favorite_colors.length == 1
      puts "Your favorite color is (#{colors[input_num-1]})!!"
      puts "Another more!? If nothing,please input other any numbers!"
    else
      puts "Your favorite colors are (#{favorite_colors})!!"
      puts "Another more!? If nothing,please input other any numbers!"
    end

  else

    if favorite_colors.length == 0
      puts "Thank you for visiting!! Good bye!!"
    else 
      puts "Thank you for using!! See you!!"
    end

    exit
  end

end