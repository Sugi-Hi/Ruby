#適した入力までのループ処理
puts "かけられる時間を時(0~24~)単位で入力してください。"
while true do
  hours = gets.to_i
    if hours >= 0
      puts "#{hours}時間:#{hours * 3600}秒"
      break
    else
      puts "時間を整数(0~24~)で入力し直してください。"
    end
end


puts "かけられる時間を分(0~60~)単位で入力してください。"

while true do
minutes = gets.to_i
  if minutes >= 0 && minutes < 60
    puts "#{minutes}分:#{minutes * 60}秒 "
    break
  elsif 

  else
    puts "何分か整数(0~60~)で入力し直してください。"
  end
end

if hours == 0 && minutes == 0
  puts "時間が無く、進められません…"
  exit
end

seconds = hours * 3600 + minutes * 60

loop{

  puts "名前(ニックネームなど)を入力してください。"
  name = gets.chomp 
  
  if name == ""
    puts "空白にせず何か入力してください。"
    redo
  else
    puts "#{name}さん、知りたい時間を秒数でお伝えします。 \n可能な#{hours}時間#{minutes}分は、#{seconds}秒ほどです！"
    break
  end

}

walk_speed = ["遅い", "やや遅い", "普通", "やや速い", "速い"]

puts "歩くスピードについてお聞きしますが、次の番号1～5の中から選択してください。"
while true do

  walk_speed.each_with_index do |speed,num|
    puts "#{num+1}.#{speed}(#{num+2}km/h程)"
  end

  input = gets.to_i
  distance = ((input+1)*seconds)*1000/3600  # 歩行スピード単位(メートル表示)：km/h⇒m/s
  kilo_distance = ((input+1)*seconds)/3600  # 歩行スピード単位(キロメートル表示)
  if input > 0 && input < 6
    puts "これから#{distance}m(#{kilo_distance}km)ほど進めます!" 
    exit
  else 
    puts "番号1～5の中から選択し直してください。" 
  end
  
end