#適した入力までのループ処理
puts "かけられる時間を時(0~24~)単位で入力してください。"
while true
  hours = gets.to_i

  if hours >= 0
    puts "#{hours}時間:#{hours * 3600}秒"
    puts "→→→→→→→→→→→→→→→→→→→→→→"
    break
  else
    puts "時間を正の整数(0~24~)で入力し直してください。"
    puts "←←←←←←←←←←←←←←←←←←←←←←"
  end

end

puts "かけられる時間を分(0~60~)単位で入力してください。"

while true
  minutes = gets.to_i

  if minutes >= 0 && minutes < 60
    puts "#{minutes}分:#{minutes * 60}秒 "
    puts "→→→→→→→→→→→→→→→→→→→→→→"
    break
  elsif minutes >= 60
    hours += minutes / 60
    puts "#{hours}時間:#{hours * 3600}秒"
    minutes = minutes % 60
    puts "#{minutes}分:#{minutes * 60}秒"
    puts "→→→→→→→→→→→→→→→→→→→→→→"
    break
  else
    puts "何分か正の整数(0~60~)で入力し直してください。"
    puts "←←←←←←←←←←←←←←←←←←←←←←"
  end

end

if hours == 0 && minutes == 0
  puts "--------------------------------------------"
  puts "時間が無く、進められません…"
  exit
end

seconds = hours * 3600 + minutes * 60

puts "--------------------------------------------"
puts "名前(ニックネームなど)を入力してください。"
loop{
  name = gets.chomp
  if name == ""
    puts "空白にせず何か名前(イニシャルなど)を入力してください。"
    puts "←←←←←←←←←←←←←←←←←←←←←←"
    redo
  else
    puts "#{name}さん、知りたい所要時間を秒数でお伝えします。 \nかけられる#{hours}時間#{minutes}分は、#{seconds}秒ほどです！"
  end


speed_rank = [{rank: "遅い", speed:2}, {rank: "やや遅い", speed:3}, {rank: "普通", speed:4}, {rank: "やや速い", speed:5}, {rank: "速い", speed:6}]
puts "--------------------------------------------"
puts "歩くスピードについてお聞きしますが、次の番号1～5の中から選択してください。"
puts "→→→→→→→→→→→→→→→→→→→→→→"
while true do

  speed_rank.each_with_index do |sr,num|
    puts "#{num+1}.#{sr[:rank]}(#{sr[:speed]}km/h程)"
  end

  input = gets.to_i

  speed = (speed_rank[input-1][:speed])
  distance = (seconds*(speed*(1000.0/3600.0))).to_f # 歩行スピード単位(自然数メートル表示)：km/h⇒m/s
  kilo_distance = (distance/1000.0).to_f  # 歩行スピード単位(小数第2位実数キロメートル表示)
  if input > 0 && input < 6
    puts "--------------------------------------------"
    puts "#{name}さん、これから#{distance.to_f.round(0)}m程歩き、(#{kilo_distance.to_f.floor(2)}km)は進めます!" 
    exit
  else 
    puts "番号1～5の中から選択し直してください。" 
    puts "←←←←←←←←←←←←←←←←←←←←←←"
  end
  
end
}