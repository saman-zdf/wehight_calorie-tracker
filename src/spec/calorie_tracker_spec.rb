require_relative "../calorie_recorder"
# require_relative "../BMI_calculator"
require_relative "../user_interface"

# test for Calorierecorder class
describe Calorierecorder do 
    name = "saman"
    user = Calorierecorder.new(name)
    # this this is to check if the user get prompt to enter name
    it "should have readable name" do
      expect(user.name).to eq(name)
    end
    # this test is for displaying the welcome method to the user
    it "sholud have a welcome method to display" do 
      expect(user.welcome).to eq(puts  "Welcome to my calorie recorder app")
    end
    # this test is for the option method that user choose from given option
    it "should display set of option to the user" do 
      expect(user.option).to eq(puts "(calorie, bmi, history)")
    end
  # this test is for to read the record of calorie
    it "should get the type of food, number of calories, time of the day" do
      total_cal = [{food: "chicken", calorie: 300, time: "morning"}]
      expect(user.get_data("chicken", 300, "morning")).to eq(total_cal)
    end
    # this test is for display methods for food, calorie and time inputs
    it "should display the data that of user input" do
      @record = [{food: "chicken", calorie: 300, time: "morning"}]
      @record.each do |item|
        puts "Meal -> #{item[:food]}, #{item[:calorie]} -> calories, Time -> #{item[:time]}"
      end 
      expect(user.display_data).to eq(@record)
    end
    # this test is for history method that will show the history of data input
    it "should display the history of data input to the user" do
      puts "your meal intake are #{@record} times!"
      @record = [{food: "chicken", calorie: 300, time: "morning"}]
      expect(user.history).to eq(puts "your meal intake are #{@record} times!")
    end

end





