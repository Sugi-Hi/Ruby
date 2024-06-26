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
  student = {name: name, room: room, jap: japanese, math: math, social: social, science: science, eng: english, sum: five_subjects } 
  students << student # 一人一人の受験生徒を全生徒へ追加
end

def index_student(students) # 全受験生徒における一覧の表示
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

def show_student(student) # 選択した受験生徒の詳細]
  puts "----------------------------------------------------------------------------------------------"
  puts "氏名：#{student[:name]} 、#{student[:room]}組"
  puts "................................................."
  puts "国語：#{student[:jap]}点、数学：#{student[:math]}点、社会：#{student[:social]}点、理科：#{student[:science]}点、英語：#{student[:eng]}点"
  puts "5教科の合計点⇒#{student[:sum]}点"  # 各生徒の5教科合計点：{student[:jap]+student[:math]+student[:social]+student[:science]+student[:eng]}
  puts "5教科の偏差値：#{student[:hensa]}"
  puts "----------------------------------------------------------------------------------------------"
end


def average(students) # 平均点
  sum_jap=0
  sum_math=0
  sum_social=0
  sum_science=0
  sum_eng=0
  sum_subjects=0 # 合計点の加算も忘れず初期値定義
  students.each do |student|
    sum_jap      += student[:jap]
    sum_math     += student[:math]
    sum_social   += student[:social]
    sum_science  += student[:science]
    sum_eng      += student[:eng]
    sum_subjects += student[:sum]
  end
  
  hensa(student)

  puts "各教科の平均点⇒ 国語：#{sum_jap/students.length}点、数学：#{sum_math/students.length}点、社会：#{sum_social/students.length}点、理科：#{sum_science/students.length}点、英語：#{sum_eng/students.length}点、5教科平均:#{sum_subjects/students.length}点"
  return (sum_subjects/students.length)
end

def hensa(student)
  sum_vari += (student[:sum]-sum_subjects/students.length)**2 / students.length
  sum_hensa = (sum_subjects - (sum_subjects/students.length )) / Math.sqrt(sum_vari) * 10.0 +50.0
  student[:hensa] = sum_hensa
end

students=[] # 全受験生徒の配列化

while true do

  puts "生徒の成績データ表について、下記の[受付番号]で選択入力して下さい！"
  puts "[0]生徒の成績データ登録"
  puts "[1]全生徒の成績データ一覧"
  puts "[2]終了"
  input = gets.to_i

  case input
  when 0
    register_student(students)
  when 1
    index_student(students)
  when 2
    puts "成績データ表は一旦保管しておきます..."
    exit
  else 
    puts "無効な受付番号なので再度0~2で選択入力して下さい!"
    puts "----------------------------------------------------------------------------------------------"
  end

end
