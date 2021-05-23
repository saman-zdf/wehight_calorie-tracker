require 'colorize'
require 'tty-prompt'
require 'terminal-table'
require "httparty"
require_relative "bmi.rb"
require_relative "calorie_recorder.rb"
require_relative "greet.rb"
require_relative "sign_up.rb"
require_relative "api.rb"
# create a new object from tty-prompt 
prompt = TTY::Prompt.new
# create a new object from UserAccount class
user_account = UserAccount.new
# create a new object from Greet class
greet = Greet.new
# create a new object from Bmi class
bmi = Bmi.new(10, 5)
# create a new object from api class
advice = Api.new

# create a boolean variable and assign it to true
status = true
# using while loop and as long as boolean var is true certain conditional statement will happen
while status == true
  # displaying ascii welcome meesage from Greet calls welcome-msg method
    greet.welcome_msg
    # display the to section, ?Sign-up and exit. if user choose to sign-up, user has to create a username and password, if user choose to exit it will exit the program
    if user_account.sign_up == "Sign-Up" 
      # using the user_account object to create a username
      user_account.get_useranme
       # using the user_account object to create a password
      user_account.get_password
    elsif user_account.sign_up == "Exit" 
      greet.bye_msg
      exit
      status = false
    end
    # create a new object from Calorierecorder calss
  user = Calorierecorder.new(user_account.username)
  system("clear")
  # display the user that he succesfully create a account
  user_account.log_in
  system("clear")
  # display the welcome message to the user that he ccan follow the instruction and user can be easily use this application 
  user.welcome
  continue = true 
  # using nested while loop and using boolean variables call continue that while is true certain condition will run, prompting the user to choose from the section(RecordCalorie BMI History Simpleadvice Exit)
  while continue == true
    puts "would you like to record your calorie intake, calculate your BMI or check the calorie history?".colorize(:cyan)
    selection = prompt.select("You can choose one of the following options", %w(RecordCalorie BMI History Simpleadvice Exit))
    system("clear")
    if selection == "RecordCalorie"
      user.calorie_recorder
      continue = true
    elsif selection == "BMI"
      # bmi.get_bmi(weight, height)
      bmi.display
      continue = true
    elsif selection == "Simpleadvice"
      advice.get_advice
    elsif selection == "History"
      user.history
      continue = true
    elsif selection == "Exit"
      greet.bye_msg
      status = true
      break
    end
    input = prompt.select("Would you like to see the option again?", %w(Yes NO))
    if input == "Yes"
      continue = true
      system("clear")
    elsif input == "NO"
      continue = false
      greet.bye_msg
      break
    end
  end
  status = false
end





