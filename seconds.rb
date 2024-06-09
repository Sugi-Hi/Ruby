puts "ようこそ！名前を入力してください"
name = gets.chomp

puts "秒数を知りたい時間を分単位で入力してください"
hours = gets.to_i
minutes = gets.to_i
seconds = hours * 3600 + minutes * 60

puts "#{name}さん、#{hours}時間#{minutes}分は#{seconds}秒です！"