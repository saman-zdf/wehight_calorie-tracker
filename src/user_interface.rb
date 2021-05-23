require 'colorize'
require 'tty-prompt'
require_relative "bmi.rb"
require_relative "calorie_recorder.rb"
require_relative "greet.rb"
require_relative "sign_up.rb"
require 'terminal-table'
# create a new object from tty-prompt 
prompt = TTY::Prompt.new
# createin a new object from UserAccount class
user_account = UserAccount.new
# createin a new object from Greet class
greet = Greet.new
# createin a new object from Bmi class
bmi = Bmi.new(10, 5)


status = true
while status == true
    greet.welcome_msg
    if user_account.sign_up == "Sign-Up" 
      user_account.get_useranme
      user_account.get_password
    elsif user_account.sign_up == "Exit" 
      greet.bye_msg
      exit
      status = false
    end
  user = Calorierecorder.new(user_account.username)
  system("clear")
  user_account.log_in
  system("clear")
  user.welcome
  continue = true 
  while continue == true
    puts "would you like to record your calorie intake, calculate your BMI or check the calorie history?".colorize(:cyan)
    selection = prompt.select("You can choose one of the following options", %w(RecordCalorie BMI History Exit))
    system("clear")
    if selection == "RecordCalorie"
      user.calorie_recorder
      continue = true
    elsif selection == "BMI"
      bmi.display
      continue = true
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





