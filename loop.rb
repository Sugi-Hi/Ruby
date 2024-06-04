default_colors = ["しろ", "くろ", "あか", "あお", "き"]
custom_colors = default_colors

puts "The colors of general lists."
default_colors.each_with_index do |color,index|
  puts "#{index+1}.#{color}色"
end


colors = ["みどり", "むらさき", "ちゃ", "だいだい", "はだ", "もも", "みず", "はい", "こん", "しゅ", "きん","ぎん","とうめい" ]
while true do
  puts "Please input your any other known colors in kana(ひらがな)!!"
  color = gets.chomp
  
  if colors.include?(color)
    custom_colors << color
  else
    break
  end
end

favorite_colors = []
while true do
  puts "Please input your favorite color on above list number from 1 to last number,if anything!(What's your favorite color?)"
  input_num = gets.to_i

  if (input_num > 0) && (input_num <= custom_colors.length)
    favorite_colors << custom_colors[input_num-1]
    
    if favorite_colors.length == 1
      puts "Your favorite color is (#{custom_colors[input_num-1]})!!"
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