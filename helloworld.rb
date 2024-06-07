def greeting
  puts "Hello,everyone."
  yield
end

greeting do
  puts "Would you write any nickname!?"
  name = gets.chomp
  puts "Nice to meet you,#{name}!"
end