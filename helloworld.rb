def greeting
  puts "Hello,everyone."
  yield
end

greeting do
  puts "Nice to meet you!"
end