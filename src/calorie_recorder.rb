require 'colorize'
require 'tty-prompt'
class Calorierecorder 
  attr_reader :name
  def initialize(name)
    @name = name
    @record = []
  end

  def welcome 
    puts "Welcome to my calorie recorder app"
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


  def get_data(type, nmuber_of_cal, time_of_day)
    total = {food: type, calorie: nmuber_of_cal, time: time_of_day}
    @record << total
  end
  
  def display_data
      @record.each do |item|
        puts "Meal -> #{item[:food]}, #{item[:calorie]} -> calories, Time -> #{item[:time]}"
      end
  end

  def history
    if @record.length == 0 
      puts "Your log is empty."
      elsif @record.length >= 1 
      @record.each_with_index do |item, index|
        puts "#{index += 1}. Meal: #{item[:food]}, #{item[:calorie]} Calories, #{item[:time]} "
      end
      puts "your meal intake are #{@record.length} times!".colorize(:green)
    end
  end
end




