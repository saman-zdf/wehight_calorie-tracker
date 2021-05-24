require 'colorize'
class Bmi 
  # attr_reader :weight, :height
  # # def initialize(weight, height)
  # #   @weight = weight
  # #   @height = height
  # # end


  # this method will calculate and return user's BMI
  def get_bmi(weight, height)
    @weight = weight
    @height = height
    begin 
    @weight / (@height * @height)
    rescue 
      p "Zero Can't be divided try again"
    end
  end
  # # in this method will display the user's BMI, using conditional statments, if user's BMI in a normal range it shows He/She has a healthy weigh, if not in a normal range, it will alert the user that he either underweight or overweight, and gives some tip to how to lose or gaing weight.
  def get_weight_height
    get_bmi(@weight, @height)  
      weight_ok = false
      until weight_ok do
        puts "Please enter your weight: ".colorize(:green)
        @weight = gets.chomp.to_f
        if @weight < 1 or @weight > 1000
          puts "Invalid weight.please try again"
        else
          weight_ok = true
        end
    end
      height_ok = false
      until height_ok do
        puts "Please enter your height: ".colorize(:green)
        @height = gets.chomp.to_f
        if @height < 1 or @height > 3
          puts "Invalid height. please try again"
        else
          height_ok = true
        end
    end
    get_bmi(@weight, @height)  
  end

  def display
      if get_bmi(@weight, @height).round(1) >=  18.4 && get_bmi(@weight, @height).round(1) <= 24.9
        puts "Good news, your BMI is #{get_bmi(@weight, @height).round(1)}, you have healthy weight.".colorize(:green)
      elsif get_bmi(@weight, @height).round(1) >= 25  && get_bmi(@weight, @height).round(1) <= 30
        puts "Your BMI is a bit high #{get_bmi(@weight, @height).round(1)}, you are overwieght".colorize(:red)
        puts "If you reduce your calorie intake by 500 calories a day, you will be able to lose (450g) in a week".colorize(:red)
      elsif get_bmi(@weight, @height).round(1) <= 18.4 && get_bmi(@weight, @height).round(1) >= 10.4
        puts "Your BMI is a bit low #{get_bmi(@weight, @height).round(1)}, you are underwieght".colorize(:yellow)
        puts "If you increase your calorie intake by 500 calories a day, you will be able to gain (450g) in a week.".colorize(:yellow)
        system("clear")
      elsif get_bmi(@weight, @height).round(1) == 0 || get_bmi(@weight, @height).round(1) >= 31
        puts "Zero Can't be divided try again"
      end
    end
end

# bmi = Bmi.new
# bmi.get_weight_height
# bmi.display