require 'date'

def mixer(fruit)
  puts "#{fruit}を細かく砕く"
  return "#{fruit}ジュース"
end

puts "フルーツを入力してください"
input = gets.chomp

puts mixer(input)

num_1 = 7**2
num_2 = 3**5
num1 = Math.sqrt(9)
num2 = Math.sqrt(3)
time = Time.now
date = Date.today

days = ["日", "月", "火", "水", "木", "金", "土"]
day = date.strftime("%u").to_i

puts "7の2乗=#{num_1.to_i}"
puts "3の5乗=#{num_2.to_i}"
puts "ルート9=#{num1.to_i}"
puts "ルート3=#{num2.to_f.round(3)}\n"
puts "#{days.max(7)}"

puts "現在:#{time}"
puts "・・・・・・・・・・・・・"
puts "時刻　#{time.strftime("%H:%M:%S")}"
puts "日付　#{date}"
puts "・・・・・・・・・・・・・"
puts "今日　#{date.strftime("%Y年%-m月%-d日(#{days[day]})")}\n"
