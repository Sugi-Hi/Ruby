def register_health(healths)
  health = {}

  puts "名前またはニックネームを入力した下さい。"
  health[:name] = gets.chomp
  puts "年齢を入力した下さい。"
  health[:age] = gets.to_i
  puts "歩行時間(分)を入力した下さい。"
  health[:walktime] = (gets.to_i) / 60
  puts "移動距離(m)を入力した下さい。"
  health[:distance] = (gets.to_i) / 1000
  puts "身長(cm)を入力した下さい。"
  health[:height] = (gets.to_f) * 0.01  # 単位(cm)⇒(m)
  puts "体重(kg)を入力した下さい。"
  health[:weight] = (gets.to_f)
 
  healths << health

end

