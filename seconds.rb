#適した入力までのループ処理
puts "秒数を知りたい時間を時(0~24~)単位で入力してください。"
while true do
  hours = gets.to_i
    if hours >= 0
      puts "#{hours}時間:#{hours * 3600}秒"
      break
    else
      puts "時間を整数(0~24~)で入力し直してください。"
    end
end


puts "秒数を知りたい時間を分(0~60)単位で入力してください。"

while true do
minutes = gets.to_i
  if minutes >= 0
    puts "#{minutes}分:#{minutes * 60}秒 "
    break
  else
    puts "何分か整数(0~60~)で入力し直してください。"
  end
end

seconds = hours * 3600 + minutes * 60

loop{
  puts "名前を入力してください。"
  name = gets.chomp 

  puts "#{name}さん、秒数でお伝えします。 \n#{hours}時間#{minutes}分は#{seconds}秒です！"
}