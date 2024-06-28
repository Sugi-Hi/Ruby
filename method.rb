require 'date'

def mixer(fruit)
  puts "#{fruit}を細かく砕く"
  return "#{fruit}ジュース"
end

puts "フルーツを入力してください"
input = gets.chomp

puts mixer(input)

num = Math.sqrt(9)
num1 = Math.sqrt(3)
time = Time.now
date = Date.today

days = ["日", "月", "火", "水", "木", "金", "土"]
day = date.strftime("%u").to_i

puts "ルート9=#{num.to_i}"
puts "ルート3=#{num1.to_f.round(3)}\n"

puts "現在:#{time}"
puts "................"
puts "時刻　#{time.strftime("%H:%M:%S")}"
puts "今日　#{date}"
puts "曜日　#{date.strftime("%Y-%-m-%-d(#{days[day]})")}\n"
