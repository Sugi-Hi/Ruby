value = 3

if value > 0
  puts "値は正です"
elsif 
  puts "値は負です"
else
  puts "値は0です"
end



input = gets.to_i

if input <= 0
   puts "0以下の数字です"
elsif input <= 10
   puts "10以下の正の数字です"
else
   puts "10より大きい数字です"
end
