def register_health(healths)
  health = {}

  puts "名前またはニックネームを入力した下さい。"
  health[:name] = gets.chomp
  puts "年齢を入力した下さい。"
  health[:age] = gets.to_i
  puts "歩行時間(分)を入力した下さい。"
  health[:walktime] = gets.to_i # 単位(分)
  puts "移動距離(km)を入力した下さい。"
  health[:distance] = gets.to_f  # 単位(km)
  puts "身長(cm)を入力した下さい。"
  health[:height] = (gets.to_f) * 0.01  # 単位(cm)⇒(m)
  puts "体重(kg)を入力した下さい。"
  health[:weight] = (gets.to_f)
  
  health[:speed] = health[:distance] / (health[:walktime]/60.0).to_f #単位(km/h)
  health[:bmi] = health[:weight] / health[:height] / health[:height]

  health[:stress] = 3
  health[:care] = 3

  healths << health

  puts "\n"
end


def index_health(healths)

  puts "健康管理データの詳細をもっと見たい受診者の方を、下記の[登録番号]で入力して下さい。"
  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}様、#{health[:age]}歳⇒速度:#{(health[:speed]).round(1)}[km/h]"
  end
  input = gets.to_i
  
  show_health(healths[input-1])
end
def show_health(health)
  puts "氏名：#{health[:name]}様"
  puts "年齢：#{health[:age]}歳"
  puts "............................................"
  puts "歩行時間：#{health[:walktime]}分"
  puts "移動距離：#{(health[:distance]*1000).to_f.round(0)}m(メートル)"
  puts "進行速度：#{(health[:speed]*1000/3600).to_f.round(2)}m/s(メートル秒)"
  puts "............................................"
  puts "身長：#{health[:height]*100}cm(センチメートル)"
  puts "体重：#{health[:weight]}kg(キログラム)"
  puts "BMI値:#{(health[:bmi]).round(2)}"
  puts "............................................"
end


def data_health(healths)
  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}様、#{health[:age]}歳⇒BMI(体脂肪率):#{health[:bmi]}"

    if health[:bmi] > 24
      puts "⇒⇒痩せる事を考えましょう！"
      puts "--------------------------------------------"
    elsif health[:bmi] < 20
      puts "⇒⇒肥えても良いでしょう！"
      puts "--------------------------------------------"
    else
      puts "⇒⇒丁度良い感じです。"
      puts "--------------------------------------------"
    end

  end
  
end


def stress_health(healths)
  puts "日頃の仕事・家事・生活などの影響により、歩行・体質からストレス度合のレベル(1~5)で判定してみます。"
  puts "あなたにとって、適度と思う歩行速度を数値(1.00~9.99[km/h])<一般平均:4.00[km/h]>で入力して下さい。"
  while true
    proper_speed = gets.to_f
    if proper_speed >= 1.00 && proper_speed < 10.00
      break
    else
      puts "適切の範囲を数値(1.00~9.99[km/h])で入力し直して下さい。"
    end
  end

  puts "--------------------------------------------"
  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}様、#{health[:age]}歳⇒歩行速度:#{health[:speed].round(1)}}[km/h] | BMI(体脂肪率):#{health[:bmi].round(2)}"
    walk_stress = (health[:speed] - proper_speed).abs
    if walk_stress > 5.0 || health[:bmi] < 17 || health[:bmi] > 27
      level = 5
    elsif walk_stress <= 5.0 && walk_stress >= 3.5
      if health[:bmi] < 17 || health[:bmi] > 27
        level = 4
      elsif (health[:bmi] >= 17 && health[:bmi] < 20) || (health[:bmi] <= 27 && health[:bmi] > 24)
        level = 3
      else 
        level = 2
      end
    elsif walk_stress < 3.5 && walk_stress >= 2.0
      if health[:bmi] < 17 || health[:bmi] > 27
        level = 3
      elsif (health[:bmi] >= 17 && health[:bmi] < 20) || (health[:bmi] <= 27 && health[:bmi] > 24)
        level = 2
      else 
        level = 1
      end
    elsif walk_stress <= 2.0 && walk_stress >= 1.0
      if health[:bmi] < 17 || health[:bmi] > 27
        level = 2
      else 
        level = 1
      end
    else
      level = 1
    end
    puts "ストレスレベル：#{level}"
    health[:stress] = level
    puts "............................................"
  end

  puts "[レベル1]特に無くて平気"
  puts "[レベル2]ややあっても大丈夫"
  puts "[レベル3]努力で何とかなってる"
  puts "[レベル4]大変で協力欲しい"
  puts "[レベル5]過剰な為に要改善"
  puts "--------------------------------------------"
 
  puts "健康推進の為、ストレス度合の判定から、予防へのケア対策プランが必要な受診者の方を、上記の[登録番号]で入力して下さい！"
  index = gets.to_i

  status_health(healths[index-1])
end
def status_health(health)
  puts "--------------------------------------------"
  puts "氏名：#{health[:name]}様"
  puts "年齢：#{health[:age]}歳"
  puts "............................................"
  puts "ストレスレベル判定：#{health[:stress]}"
  puts "速度:#{health[:speed].round(1)}[km/h]"
  puts "BMI(体脂肪率):#{health[:bmi].round(2)}"
  puts "............................................"
  puts "★リフレッシュにおいて、必要なケア対策ランク"
  puts "⇒⇒⇒健康状態：ケア対策ランク#{health[:stress]}"
  puts "--------------------------------------------"
  case health[:stress]
  when 1
    puts "[ランク1]わざわざ対策しなくても、いつも通りで平気."
  when 2
    puts "[ランク2]趣味を探して、リフレッシュできる機会を増やす.。"
  when 3
    puts "[ランク3]健康推進の生活習慣・食品の購入などを心がける。！"
  when 4    
    puts "[ランク4]ケアプランなど協力してくれるカウンセラーを求める！！"
  when 5
    puts "[ランク5]医療・福祉など専門医・訓練士のサポートが必要不可欠となる！！！"

  end

end


healths = []


while true do

puts "+*+ヘルスケアとして、下記の受診内容[チェック番号]を入力して下さい+*+"
puts "[0]健康診断での受診者を登録する"
puts "[1]健康診断の全受診者を一覧リストで表示する"
puts "[2]身体的な健康状態、体脂肪率の数値データ評価を列挙する"
puts "[3]心理的な健康状態、ストレス度合をレベル表記してケア対策を調べる"
puts "[4]終了する"
option = gets.to_i

  case option
  when 0
    register_health(healths)
  when 1
    index_health(healths)
  when 2
    data_health(healths)
  when 3
    stress_health(healths)
  when 4
    puts "健康受診、お疲れさまでした。。。\n\n"
    exit
  else
    puts "受診内容[種類番号]が無い為、再度入力し直して下さい！\n\n"
  end

end