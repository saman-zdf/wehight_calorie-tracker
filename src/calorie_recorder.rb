require_relative "sign_up.rb"
require_relative "bmi.rb"
require_relative "api.rb"
require 'colorize'
require 'tty-prompt'
require 'terminal-table'
require 'json'
# create a class to get a user name, and data of food and calorie antake
class Calorierecorder 
  # use attr_reader to be able to read the name 
  attr_reader :name, :record, :read
    @@prompt = TTY::Prompt.new
    
  # in initializa methos which is a private method I passed 1 arguments for name and create two instance variables for name and record, and assign record varriable to an empty array
  def initialize(name)
    @name = name
    @record = []
    @read = []
    # @user = user
  end

  # create welcome method to welcome the to this app user
  def welcome 
    puts "Welcome to my calorie recorder app"
    puts "In this app you will be able to record your daily food intake with calorie and time of the day.".colorize(:cyan)
    puts "Please just follow the instruction and you will be able to use this app easily.".colorize(:cyan)
  end 
  # the option menu give set of option to the user for choosing what to do, I used tty-prompt selet and using case statement to match the user input and show the user choice
  def options 
      selection = @@prompt.select("You can choose one of the following options", %w(RecordCalorie BMI History Simpleadvice Exit))
    case selection
    when "RecordCalorie"
      calorie_recorder
      display_data
    when "BMI"
      bmi = Bmi.new
      system("clear")
      bmi.get_weight_height
      bmi.display
    when "History"
      history
    when "Simpleadvice"
      advice = Api.new
      advice.get_advice
    when "Exit"
      exit
    end
  end

# create the get data method and pass three arguments, I store the variables as a value to the hash and then append it to my @record variables
  def get_data(type, number_of_cal, time_of_day)
    total = {food: type, calorie: number_of_cal, time: time_of_day}
    @record << total
  end

  # calorie recorder methods will gets the user input and store it to the get_data method
  def calorie_recorder
    type = @@prompt.ask("Please Enter the type of the food") do |q|
      q.validate(/[a-z\ ]{2,100}/)
    end
    number_of_cal = @@prompt.ask("Please enter the number of calories") do |q|
      q.validate(/[1-2000\ ]{1,4}/)
    end
    time = @@prompt.ask("Please enter the time of the day") do |q|
      q.validate(/[a-z\ ]{2,100}/)
    end
    get_data(type, number_of_cal, time)
    # store_in_json
    system("clear")
  end
  # create a display data  method and iterate through my @record array, to display the value of each hash
  def display_data
    @table = Terminal::Table.new do |t|
      rows = []
      t.headings = ['Meal'.colorize(:yellow), 'Calories'.colorize(:yellow), 'Time of the day'.colorize(:yellow)]
      @record.each do |item|
        t << [item[:food], item[:calorie], item[:time]] 
        t << :separator
        t.style = {:border_top => false, :border_bottom => false, :width => 80,:border_x => "=".colorize(:blue),:border_i => "*".colorize(:red)}
      end
    end
    puts @table
    @read <<  @table
    File.write('test.json', JSON.dump(@read))
  end
  # store the accuount and food data into json file
  # def store_in_json
  # end
  # create a history method to show the history of records, used jason file to read the data of user inputs.
  def history
    # using map to get the sum of the calories
    system('clear')
      sum_calorie = @record.map { |cal| cal[:calorie].to_i }.sum
      puts "You have had #{@record.length} meals, and #{sum_calorie} calories in total.".colorize(:green)
      # if data hash is empty it will show an error, just used manual error handling to show the user the log is empty
      begin
        file = File.read("./test.json")
        data_hash = JSON.parse(file)
        puts data_hash
      rescue
        puts "Your log is empty, please record your food and calorie intake."
      end
  end
end
