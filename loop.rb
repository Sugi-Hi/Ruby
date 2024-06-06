numbers = []

puts "What times do you want to repeat!??"
input = gets.to_i


loop{

  puts "#{input}回ルーティン入力です！"
  input.times do

    puts "Please input your favorite number in integer!"
    number = gets.to_i
    numbers << number

  end

  sum = 0
  mul = 1
  numbers.each do |number|
    sum += number
    mul *= number
  end
  puts "合計値：#{sum}"
  puts "積算値：#{mul}"


  puts "Please continue by inputting in the number of times!! If you want to finish,please input 0 or brank!!"
  input = gets.to_i
    if input != 0 && input != ""
      puts "Let's continue!!"
      redo
    else
      puts "Thank you for using!!"
      break
    end

}