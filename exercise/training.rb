# ======  入出力  =====================

puts "何か入力して下さい！"
str = gets.chomp


puts "#{str}を入力完了！ \nOKです! \n"


# ======  生徒名  =====================

class Student

  def set_name(name)
    @name = name
  end

  def introduce
    puts "私の名前は#{@name}です。"
  end

end

student = Student.new
student.set_name("原")
student.introduce


# ======  体調　  ======================


def condition(&energy)
  puts "How are you?"
  energy.call("I'm fine now!")
end

condition do |c|
  puts c
end


