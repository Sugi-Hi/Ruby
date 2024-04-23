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


def index_health(healths)

  puts "健康管理データを見たい人の登録番号を入力して下さい。"
  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}、#{health[:age]}歳⇒速度:#{(health[:distance]*0.001)/(health[:walktime]/60)}[km/h]"
  end
  input = gets.to_i
  
  show_health(health[input-1])

end
def show_health(health)
  puts "氏名：#{health[:name]}"
  puts "年齢：#{health[:age]}歳"
  puts "歩行時間：#{health[:walktime]}分"
  puts "移動距離：#{health[:distance]}m(メートル)"
  puts "身長：#{health[:height]*100}cm(センチメートル)"
  puts "体重：#{health[:weight]}kg(キログラム)"
  data_health(health)
end
def data_health(health)
  bmi = health[:weight]/health[:height]/health[:height]
  puts "[#{index+1}]#{health[:name]}、#{health[:age]}歳⇒BMI(体脂肪率):#{bmi}"

end


def stress_health(healths)

end

def status_health(health)
end
healths = []


puts "健康診断への受診内容[種類番号]を入力して下さい。"
puts "[0]健康診断での受診者を登録する"
puts "[1]健康診断の全受診者を一覧リストで表示する"
puts "[2]健康状態の目安となる数値データで取り出す"
puts "[3]現在のストレスチェックから健康状態を表記する"
puts "[4]終了する"
option = gets.to_i

while true do

  case option
  when 0
    register_health(healths)
  when 1
    index_health(healths)
  when 2
    data_health(healths)
  when 3
    status_health(healths)
  when 4
    exit
  else
    puts "受診内容[種類番号]が無い為、再度入力し直して下さい！"
  end

end