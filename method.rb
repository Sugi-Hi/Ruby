def mixer(fruit)
  puts "#{fruit}を細かく砕く"
  return "#{fruit}ジュース"
end

puts "フルーツを入力してください"
input = gets.chomp

puts mixer(input)

num = Math.sqrt(9)
num1 = Math.sqrt(3)



puts "ルート9=#{num.to_i}"
puts "ルート3=#{num1.to_f.round(3)}"
