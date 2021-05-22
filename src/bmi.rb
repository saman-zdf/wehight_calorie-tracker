require 'colorize'
class Bmi 
  attr_reader :weight, :height
  # def initialize(weight, height)
  #   @weight = weight
  #   @height = height
  # end


  # this method will calculate and return user's BMI
  def get_bmi(weight, height)
    @weight = weight
    @height = height
    @weight / (@height * @height)
  end
  # # in this method will display the user's BMI, using conditional statments, if user's BMI in a normal range it shows He/She has a healthy weigh, if not in a normal range, it will alert the user that he either underweight or overweight, and gives some tip to how to lose or gaing weight.
  def display
    if get_bmi(@weight, @height).round(1) >= 18.4 && get_bmi(@weight, @height).round(1) <= 24.9
      puts "Good news, your BMI is #{get_bmi(@weight, @height).round(1)}, you have healthy weight.".colorize(:green)
    elsif get_bmi(@weight, @height).round(1) >= 25
      puts "Your BMI is a bit high #{get_bmi(@weight, @height).round(1)}, you are overwieght".colorize(:red)
      puts "If you reduce your calorie intake by 500 calories a day, you will be able to lose (450g) in a week".colorize(:red)
    elsif get_bmi(@weight, @height).round(1) <= 18.3
      puts "Your BMI is a bit low #{get_bmi(@weight, @height).round(1)}, you are underwieght".colorize(:yellow)
      puts "If you increase your calorie intake by 500 calories a day, you will be able to gain (450g) in a week.".colorize(:yellow)
    end
  end
end
