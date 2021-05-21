require 'colorize'
require 'tty-prompt'
# create a class to get a user name, and data of food and calorie antake
class Calorierecorder 
  # use attr_reader to be able to read the name 
  attr_reader :name
  # in initializa methos which is a private method I passed 1 arguments for name and create two instance variables for name and record, and assign record varriable to an empty array
  def initialize(name)
    @name = name
    @record = []
  end
# create welcome method to welcome the to this app user
  def welcome 
    puts "Welcome to my calorie recorder app"
    puts "In this app you will be able to record your daily food intake with calorie and time of the day.".colorize(:cyan)
    puts "Please just follow the instruction and you will be able to use this app easily.".colorize(:cyan)
  end 

  def option 
    puts "#{@name}:".colorize(:cyan)
    puts "would you like to record your calorie intake, calculate your BMI or check the calorie history?".colorize(:cyan)
  end

# create the get data method and pass three arguments, I store the variables as a value to the hash and then append it to my @record variables
  def get_data(type, nmuber_of_cal, time_of_day)
    total = {food: type, calorie: nmuber_of_cal, time: time_of_day}
    @record << total
  end
  # create a display data  method and iterate through my @record array, to display the value of each hash
  def display_data
      @record.each do |item|
        puts "Meal -> #{item[:food]}, #{item[:calorie]} -> calories, Time -> #{item[:time]}"
      end
  end
# create a history method to show the history of records, used the conditinal staement if the sistory is empty it will display your log is empty, io
  def history
    if @record.length == 0 
      puts "Your log is empty."
      elsif @record.length >= 1 
      @record.each_with_index do |item, index|
        puts "#{index += 1}. Meal: #{item[:food]}, #{item[:calorie]} Calories, #{item[:time]} "
      end
      sum_calorie = @record.map { |x| x[:calorie] }.sum
      puts "your meal intake are #{@record.length} times, and have #{sum_calorie} calories in total.".colorize(:green)
    end
  end
end





