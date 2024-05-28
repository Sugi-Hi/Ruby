colors = ["あか", "あお", "きいろ", "みどり", "しろ", "くろ", "むらさき"]

colors.each_with_index do |color,index|
  puts "(#{index+1})色: #{color}"
end

favorite_colors = []

while true do
  puts "Please input your favorite color number from 1 to 7!(What's your favorite color?)"
  input_num = gets.to_i

  if (input_num > 0) && (input_num <= 7)
    puts "Your favorite color is (#{colors[input_num-1]})!!"
    favorite_colors << colors[input_num-1]
    puts "Another more!? If nothing,please input other any numbers!"

    if (input_num > 0) && (input_num <= 7)
      puts "Your favorite colors are (#{favorite_colors})!!"
    else
      puts "Thank you for using !!See you!!"
      exit
    end

  else
    puts "Thank you for using!!Good bye!!"
    exit
  end

end