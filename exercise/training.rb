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


# ======  医療情報  ====================

class Recover

  def initialize( kind, volume )
    @kind = kind
    @volume = volume
  end

  def info
    puts "回復法：#{@kind} 、含有量：#{@volume}g"
  end

end

class Care < Recover

  def info
    quality = "専門医療"
    puts "回復法：#{@kind} 、含有量：#{@volume}g、質：#{quality} "
  end    

end

care = Care.new( "救急治療", 150)
care.info


# ======  標準ライブラリ(日付)  =========
require "date"

puts Date.today
