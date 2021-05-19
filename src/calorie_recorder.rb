require 'colorize'
class Calorierecorder 
  attr_reader :name
  def initialize(name)
    @name = name
    @record = []
  end

  def welcome 
    puts "Welcome #{@name} to my calorie recorder app".colorize(:blue)
    puts "In this app you will be able to recorde your daily food intake with calorie and time of the day.".colorize(:blue)
    puts "Please just follow the instruction and you will be able to use this app easily.".colorize(:blue)
    puts "would you like to continue?(Y/N)".colorize(:blue)
  end 

  def option 
    puts "#{name}:".colorize(:cyan)
    puts "would you like to record your calorie intake, calculate your BMI or check the calorie history?".colorize(:cyan)
    puts "please choose from the selection".colorize(:cyan)
    puts "(calorie,bmi, history)".colorize(:cyan)
  end


  def get_calorie(type, nmuber_of_cal, time_of_day)
    total = {food: type, calorie: nmuber_of_cal, time: time_of_day}
    @record << total
  end
  
  def display
    if @record == []
      puts "Your record is empty"
    elsif @record.length == 1
      @record.each do |item|
        puts "Meal -> #{item[:food]}, #{item[:calorie]} -> calories, Time -> #{item[:time]}"
      end
    elsif @record >= 2 
      @record.each do |item|
        puts "Meal -> #{item[:food]}, #{item[:calorie]} -> calories, Time -> #{item[:time]}"
      end
      puts "You have had #{@record.length} inputs."
    end 
  end
end


class Bmi < Calorierecorder
  attr_reader :weight, :height
  # in this method create two instance variables to get the weight and height of the user
  def initialize(weight, height)
    @weight = weight
    @height = height
  end

  # this method will calculate and return user's BMI
  def get_bmi
    total_bmi = @weight / (height * height)
    puts total_bmi
  end
end


loop do 
  puts "please Enter you name: "
  name = gets.chomp
  user = Calorierecorder.new(name)
  user.welcome
  input = gets.chomp
  break if input != "y"
  option = true
  while option == true && input == "y"
    user.option 
    user_input = gets.chomp.downcase
    if user_input == "calorie" && option == true
      puts "Please enter the type of food: "
      food = gets.chomp
      puts "Please enter the amount of calories: "
      calorie = gets.chomp
      puts "Please enter the time of day:"
      time = gets.chomp
      user.get_calorie(food, calorie, time)
      user.display
      option == true
    elsif user_input == "bmi" && option == true
      puts "Please enter your weight: (kg)"
      weight = gets.chomp.to_f 
      puts "Please enter your height:(m),like(1.75)"
      height = gets.chomp.to_f
      bmi = Bmi.new(weight, height)
      bmi.get_bmi
      option = true
    elsif user_input == "history" && option == true
      user.display
      option = true
    end
    puts "Would you like to continue?(Y/N)"
    answer = gets.chomp
    if answer == "y"
      option = true
    else answer != Y
      puts "thank you for using our app #{user.name}, good luck!"
      option = false
    end

  end
end
