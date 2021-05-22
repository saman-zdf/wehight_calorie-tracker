require 'colorize'
require 'tty-prompt'
require 'terminal-table'
# create a class to get a user name, and data of food and calorie antake
class Calorierecorder < Terminal::Table
  # use attr_reader to be able to read the name 
  attr_reader :name, :username, :password
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
    @table = Terminal::Table.new do |t|
      rows = []
      t.headings = ['Meal'.colorize(:yellow), 'Calories'.colorize(:yellow), 'Time of the day'.colorize(:yellow)]
      @record.each do |item|
        t << [item[:food], item[:calorie], item[:time] ] 
        t << :separator
        t.style = { :border_top => false, :border_bottom => false, :width => 80,:border_x => "=".colorize(:blue),:border_i => "*".colorize(:red)}
      end
    end
    puts @table
  end
# create a history method to show the history of records, used the conditinal staement if the sistory is empty it will display your log is empty, io
  def history
    if @record.length == 0 
      puts "Your log is empty."
      elsif @record.length >= 1 
        puts ''
      @table = Terminal::Table.new do |t|
          rows = []
          t.headings = ['Meal', 'Calories', 'Time of the day']
        @record.each do |item|
          t << [item[:food], item[:calorie], item[:time] ] 
          t << :separator
          t.style = { :border_top => false, :border_bottom => false, :width => 80}
        end
    end
      puts @table
      sum_calorie = @record.map { |x| x[:calorie] }.sum
      puts "you have had #{@record.length} meals, and  #{sum_calorie} calories in total.".colorize(:green)
    end
  end


  def display_bye
    puts "Thank you for visiting us, please caome back again".colorize(:light_magenta)
      puts ""
        puts "$$$$$$$\ $$\     $$\ $$$$$$$$\ 
$$  __$$\\$$\   $$  |$$  _____|
$$ |  $$ |\$$\ $$  / $$ |      
$$$$$$$\ | \$$$$  /  $$$$$\    
$$  __$$\   \$$  /   $$  __|   
$$ |  $$ |   $$ |    $$ |      
$$$$$$$  |   $$ |    $$$$$$$$\ 
\_______/    \__|    \________|
          ".colorize(:yellow)
  end
end

# user = Calorierecorder.new("saman")
# user.get_data("Tuna", 300, "Morning")
# user.get_data("pizza", 400, "Midday")
# user.get_data("chicken", 500, "Afternoon")
# user.get_data("beef", 900, "Night")
# user.display_data