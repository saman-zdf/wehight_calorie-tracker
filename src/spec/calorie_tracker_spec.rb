require_relative "../calorie_recorder"
require_relative "../bmi"
require_relative "../greet"
require_relative "../api"
require_relative "../sign_up"
require "tty-prompt"

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

  # this test is for to read the record of calorie
    it "should get the type of food, number of calories, time of the day" do
      total_cal = [{food: "chicken", calorie: 300, time: "morning"}]
      expect(user.get_data("chicken", 300, "morning")).to eq(total_cal)
    end
    # this test is for display methods for food, calorie and time inputs
    it "should display user input data" do
      record = [{food: "chicken", calorie: 300, time: "morning"}]
      expect(user.display_data).to eq(table)
    end
    # this test is for history method that will show the history of data input
    it "should display the history of data input to the user" do
      puts "your meal intake are #{@record} times!"
      @record = [{food: "chicken", calorie: 300, time: "morning"}]
      expect(user.history).to eq(puts "your meal intake are #{@record} times!")
    end

end


# tests for BMI class
# describe Bmi do 
#   weight = 80
#   height = 1.82
#   bmi = Bmi.new(weight, height)
#   # this test should have a redable weight 
#   it "should have a readable weight" do
#   expect(bmi.weight).to eq(80)
#   end
#   # this test should have a readable height
#   it "should have a readable height" do

#   expect(bmi.height).to eq(1.82)
#   end
#   # this test is for calculating the BMI
#   it "should calculate the bmi" do 
#     total_bmi = weight / (height * height)
#     expect(bmi.get_bmi(weight, height)).to eq(weight / (height * height))
#   end 
# end




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



# this test is for for creating a api class
describe Api do 
  api = Api.new
  it "should create a api class" do
    expect(api).to eq(api)
  end
# this test is for to display the user some random advice from api
  it "should display the api advice" do 
    expect(api.get_advice).to eq(api.get_advice)
  end
end


# this test is for create a Useraccount class
describe UserAccount do
  account = UserAccount.new
  it "should create a useraccount class" do
    expect(account).to eq(account)
  end
  # this test is the method for sign_up message, to rpomt the user to sign-up
  it "should display the user to sign-up or exit" do 
    prompt = TTY::Prompt.new
    expect(account.sign_up).to eq(prompt = prompt.select("Would you like to sign-up or exit", %W(Sign-Up Exit)))
  end
  # this test is for the method to create a username
  it "should create a username" do
    prompt = TTY::Prompt.new
    username = prompt.ask("Create a username:")
    expect(account.get_useranme).to eq(username = prompt.ask("Create a username:"))
  end
  # this test is for the method to create a password
  it "should create a password" do
    prompt = TTY::Prompt.new
    password = prompt.mask("Create a password:")
    expect(account.get_password).to eq(password = prompt.ask("Create a password:"))
  end
  # this test is for the method to create a password
  it "should display and congaratulate the user" do
    expect(account.log_in).to eq(true)
  end
end
