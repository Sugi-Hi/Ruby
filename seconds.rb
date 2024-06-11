puts "名前を入力してください。"
name = gets.chomp

puts "秒数を知りたい時間を時(0~24)単位で入力してください。"
hours = gets.to_i
puts "秒数を知りたい時間を分(0~60)単位で入力してください。"
minutes = gets.to_i
seconds = hours * 3600 + minutes * 60

puts "#{hours}時間:#{hours * 3600}秒 \n#{minutes}分:#{minutes * 60}秒 "
puts "#{name}さん、#{hours}時間#{minutes}分は#{seconds}秒です！"