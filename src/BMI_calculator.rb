require 'colorize'
class Bmi 
  attr_reader :weight, :height
  # in this method create two instance variables to get the weight and height of the user
  def initialize(weight, height)
    @weight = weight
    @height = height
  end

  # this method will calculate and return user's BMI
  def get_bmi(total_bmi)
    @total_bmi = total_bmi
    @total_bmi = @weight / (height * height)
    # puts @total_bmi
  end
  
  def display
    if get_bmi(@total_bmi).round(1) >= 18.4 && get_bmi(@total_bmi).round(1) <= 24.9
      puts "Good news, your BMI is #{get_bmi(@total_bmi).round(1)}, you have healthy weight.".colorize(:green)
    elsif get_bmi(@total_bmi).round(1) >= 25
      puts "Your BMI is a bit high #{get_bmi(@total_bmi).round(1)}, you are overwieght".colorize(:red)
      puts "If you reduce your calorie intake by 500 calories a day, you will be able to lose (450g) in a week".colorize(:red)
    elsif get_bmi(@total_bmi).round(1) <= 18.3
      puts "Your BMI is a bit low #{get_bmi(@total_bmi).round(1)}, you are underwieght".colorize(:yellow)
      puts "If you increase your calorie intake by 500 calories a day, you will be able to gain (450g) in a week.".colorize(:yellow)
    end
  end
    
end
