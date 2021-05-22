require_relative "../calorie_recorder"
require_relative "../bmi"
require_relative "../greet"
# require_relative "../user_interface"

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
      record = [{food: "chicken", calorie: 300, time: "morning"}]
      expect(user.display_data).to eq(user.display_data)
    end
    # this test is for history method that will show the history of data input
    it "should display the history of data input to the user" do
      puts "your meal intake are #{@record} times!"
      @record = [{food: "chicken", calorie: 300, time: "morning"}]
      expect(user.history).to eq(puts "your meal intake are #{@record} times!")
    end

end


# tests for BMI class
describe Bmi do 
  weight = 80
  height = 1.82
  bmi = Bmi.new(weight, height)
  # this test should have a redable weight 
  it "should have a readable weight" do
  expect(bmi.weight).to eq(80)
  end
  # this test should have a readable height
  it "should have a readable height" do

  expect(bmi.height).to eq(1.82)
  end
  # this test is for calculating the BMI
  it "should calculate the bmi" do 
    total_bmi = weight / (height * height)
    expect(bmi.get_bmi(weight, height)).to eq(weight / (height * height))
  end 
  # this test is for displaying the bmi
  it "should display the bmi to the user" do
    expect(bmi.display).to eq(display)
  end
end


# test the calss for ascii welcome and bye message
describe Greet do
  greet = Greet.new
  # this test should display welcome message
  it "should display ascii welcome message" do
    expect(greet.welcome_msg).to eq(puts "welcome")
  end
  # this test should display bye message
  it "should display ascii bye message" do
    expect(greet.bye_msg).to eq(puts "bye")
  end

end



