class Car

  def initialize(car_name, car_model, capacity)
    @name = car_name
    @model = car_model
    @capacity = capacity
  end

  def self.run
    puts '走行します'
  end

  def ride_car(ride_number)
    @ride_number = ride_number
    if ride_number > @capacity
      puts "#{@name}は、乗車定員が#{@capacity}人なので、#{ride_number}人は乗れません。"
    else
      puts "#{ride_number}人乗車できました。"
    end
  end

end

fire_truck = Car.new('消防車', '大型車', 5)
fire_truck.ride_car(3)

Car.run


# ======  クラス継承  ===================

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