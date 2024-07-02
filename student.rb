# \\\\\\\\\\\\\\\\\\\ 受験生徒の5教科点数の登録 \\\\\\\\\\\\\\\\\\\
def register_student(students)
  puts "氏名を入力して下さい:"
  name = gets.chomp
  puts "何組か入力して下さい:"
  room = gets.chomp
  puts "................................................."
  puts "国語の点数を入力して下さい:"
  japanese = gets.to_i
  puts "数学の点数を入力して下さい:"
  math = gets.to_i
  puts "社会の点数を入力して下さい:"
  social = gets.to_i
  puts "理科の点数を入力して下さい:"
  science = gets.to_i
  puts "英語の点数を入力して下さい:"
  english = gets.to_i

  five_subjects = japanese + math + social + science + english # 合計点
  
  # 各受験生徒のデータ成績のハッシュ化
  student = {name: name, room: room, jap: japanese, math: math, social: social, science: science, eng: english, sum: five_subjects, no: (students.length+1)}
  student[:hensa] = 0

  students << student # 一人一人の受験生徒を全生徒へ追加
end

# \\\\\\\\\\\\\\\\\\\ 全受験生徒における一覧の表示 \\\\\\\\\\\\\\\\\\\
def index_student(students) 
  puts "----------------------------------------------------------------------------------------------"
  puts "生徒一覧表#受験者"
  puts "................................................."
  students.each_with_index do |student, index|  # index:初期値0、数値化できない!
    puts "受験番号：[00#{index+1}]  氏名：#{student[:name]} 、#{student[:room]}組"
  end
  puts "受験生徒数：#{students.length}名"
  puts "----------------------------------------------------------------------------------------------"
  average(students) # 全生徒の受験した各5教科の平均点：students.each do |s|  // Jap+=s[:jap]/students.length, Math+=s[:math]/students.length, Social+=s[:social]/students.length, Science+=s[:science]/students.length, Eng+=s[:eng]/students.length // end
  puts "................................................."
  puts "見たい生徒を受験番号(上位ケタの0を抜いて)で選択入力して下さい！"

  loop{
  input = gets.to_i

  if input > 0 && input <= students.length
    show_student(students[input-1]) # 指定受験生徒の詳細：配列データ要素の抽出
    break
  else
    puts "入力した受験番号は存在しません。再度を選択し直して下さい。"
    redo
  end
  }
end

# ------------------ 選択した受験生徒の詳細 ------------------
def show_student(student) 
  puts "----------------------------------------------------------------------------------------------"
  puts "○氏名：#{student[:name]} 、#{student[:room]}組"
  puts "................................................."
  puts "・国語：#{student[:jap]}点、数学：#{student[:math]}点、社会：#{student[:social]}点、理科：#{student[:science]}点、英語：#{student[:eng]}点"
  puts "5教科の合計点⇒#{student[:sum]}点"  # 各生徒の5教科合計点：{student[:jap]+student[:math]+student[:social]+student[:science]+student[:eng]}
  puts "5教科の偏差値：#{student[:hensa].to_f.round(2)}"
  puts "----------------------------------------------------------------------------------------------"
end

# ~~~~~~~~~~~~~~~~~~ 平均点 ~~~~~~~~~~~~~~~~~~
def average(students) 
 # 合計点の加算も忘れず初期値定義
  sum_jap = 0
  sum_math = 0
  sum_social = 0
  sum_science = 0
  sum_eng = 0
  sum_subjects = 0
  sum_ave = 0
  students.each do |student|
    sum_jap      += student[:jap]
    sum_math     += student[:math]
    sum_social   += student[:social]
    sum_science  += student[:science]
    sum_eng      += student[:eng]
    sum_subjects += student[:sum]
  end
  sum_ave = (sum_subjects/students.length).to_f

  hensa(students,sum_ave)

  puts "各教科の平均点⇒ 国語：#{sum_jap/students.length}点、数学：#{sum_math/students.length}点、社会：#{sum_social/students.length}点、理科：#{sum_science/students.length}点、英語：#{sum_eng/students.length}点"
  puts "5教科平均点:#{sum_ave.to_f.round(0)}点"
end
# ~~~~~~~~~~~~~~~~~~ 分散⇒標準偏差、偏差値の計算 ~~~~~~~~~~~~~~~~~~
def hensa(students,sum_ave)
  sum_vari = 0
  students.each do |student|
    sum_vari += ((student[:sum]-sum_ave)**2 / students.length).to_f
  end

  students.each do |student|
    sum_hensa = ((student[:sum] - sum_ave) / Math.sqrt(sum_vari)) * 10.0 +50.0 # sqrt()：平方根関数
    student[:hensa] = sum_hensa.to_f
  end

end

# \\\\\\\\\\\\\\\\\\\ 合計点・偏差値によるランキング順位 \\\\\\\\\\\\\\\\\\\
def rank_student(students)
  puts "----------------------------------------------------------------------------------------------"
  puts "成績ランキング順位表#受験者番号"
  puts "................................................."
  ranking = students
  ranking.reverse!{|rank| rank[:sum]}
  ranking.each_with_index do |rank, index|
    puts "#{index+1}位：[00#{rank[:no]}]#{rank[:sum]}点、偏差値#{rank[:hensa]}"
  end
  puts "----------------------------------------------------------------------------------------------"

end


students=[] # 全受験生徒の配列化


while true do

  puts "生徒の成績データ表について、下記の[受付番号]で選択入力して下さい！"
  puts "[0]生徒の成績データ登録"
  puts "[1]全生徒の成績データ一覧"
  puts "[2]全生徒のランキング順位表"
  puts "[3]終了"
  input = gets.to_i

  case input
  when 0
    register_student(students)
  when 1
    index_student(students)
  when 2
    rank_student(students)
  when 3
    puts "成績データ表は一旦保管しておきます..."
    exit
  else 
    puts "無効な受付番号なので再度0~2で選択入力して下さい!"
    puts "----------------------------------------------------------------------------------------------"
  end

end
