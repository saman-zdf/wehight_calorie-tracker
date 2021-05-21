require 'colorize'
require 'tty-prompt'
require_relative "bmi.rb"
require_relative "calorie_recorder.rb"
# require "test.yml"
prompt = TTY::Prompt.new


# in this loop the user have st of option, like sign up, create username and password, and login,
# and prmopt the user to choose if user to update calorie intake or calulate bmi or see the history of calorie intake 
loop do 
  puts " _     _  _______  ___      _______  _______  __   __  _______   _______  _______   _______  __   __  ___  _______   _______  _______  _______ 
| | _ | ||       ||   |    |       ||       ||  |_|  ||       | |       ||       | |       ||  | |  ||   ||       | |   _   ||       ||       |
| || || ||    ___||   |    |       ||   _   ||       ||    ___| |_     _||   _   | |_     _||  |_|  ||   ||  _____| |  |_|  ||    _  ||    _  |
|       ||   |___ |   |    |       ||  | |  ||       ||   |___    |   |  |  | |  |   |   |  |       ||   || |_____  |       ||   |_| ||   |_| |
|       ||    ___||   |___ |      _||  |_|  ||       ||    ___|   |   |  |  |_|  |   |   |  |       ||   ||_____  | |       ||    ___||    ___|
|   _   ||   |___ |       ||     |_ |       || ||_|| ||   |___    |   |  |       |   |   |  |   _   ||   | _____| | |   _   ||   |    |   |    
|__| |__||_______||_______||_______||_______||_|   |_||_______|   |___|  |_______|   |___|  |__| |__||___||_______| |__| |__||___|    |___|    

".colorize(:light_magenta)
  # this code will ask if user wants to sign-up or exit
  question = prompt.select("Would like to Sign-Up or Exit", %w(Sign-up Exit))
  if question == "Sign-up"
    system("clear")
  elsif question == "Exit"
    puts ""
    puts "$$$$$$$\ $$\     $$\ $$$$$$$$\ 
$$  __$$\\$$\   $$  |$$  _____|
$$ |  $$ |\$$\ $$  / $$ |      
$$$$$$$\ | \$$$$  /  $$$$$\    
$$  __$$\   \$$  /   $$  __|   
$$ |  $$ |   $$ |    $$ |      
$$$$$$$  |   $$ |    $$$$$$$$\ 
\_______/    \__|    \________|

".colorize(:light_magenta)
    puts "Thanks for visiting us, good luck!".colorize(:cyan)
    break
  end
  continue = true
  # this while loop is for creating username and password,
  # when user create the username user get promp if user sure to choose a right username, if yse continue, if no user can type new username
  while continue
    puts "For sign-up you need to create an account, let's start".colorize(:cyan)
    username1 = prompt.ask("Please create a username: ")
    system("clear")
    answer = prompt.ask("You created #{username1}, Are you sure?(Y/N)")
    system("clear")
    if answer == "y"
      break
    else
      continue = true
    end
  end
  continue_2 = true
  # this while is for user to create a password and to retype the password, if user retype the wrong password, user will get prompt "Wrong combination, try to create a password again" 
  while continue_2
    password = prompt.mask("Please create a Password: ")
    system("clear")
    password_2 = prompt.mask("Please retype your password: ")
    system("clear")
    if password == password_2
      break
      system("clear")
      elsif password != password_2
        puts "Wrong combination, please try to create a password again ".colorize(:red)
        continue_2 = true
    end
  end
  # in this create a new object form Calorierecoder 
  # and display a welcome meesage to thye user
  user = Calorierecorder.new(username1)
  user.welcome
  # in this while loop ask the user to log in by putting username and password
    continue_3 = true
  while continue_3 == true  
      puts "To use this app enter your username and password to log-in"
      username = prompt.ask("Username:")
      userpass = prompt.mask("Password: ")
    if username == username1 && userpass == password
      continue_3 = false
      system('clear')
      break
    else
      puts "Wrong credentials, please try agin"
      continue_3 = true
    end
  end
  # in this while loop we will display ask the user what kind option there are to choose
  option = true
  while option == true
    user.option
    display_option = prompt.select("You can choose one of the following options", %w(RecordCalorie BMI History Exit))
    system("clear ")
    # if the user chooses to record the calorie intake, it will ask to input the typr meal, number of calorie and time of the day
    if display_option == "RecordCalorie" && option == true
      puts "Please enter the type of the food: ".colorize(:yellow)
      food = gets.chomp
      puts "Please enter the number of calories: ".colorize(:yellow)
      calorie = gets.chomp.to_i
      puts  "Please salect time of the day: (Morning, Afternoon, Night)".colorize(:yellow)
      time = gets.chomp
      user.get_data(food, calorie, time)
      system("clear")
      user.display_data
      option = true
      # if the user chooses to check the BMI, it will ask go weight and for the height and return the bmi 
    elsif display_option == "BMI" && option == true
      puts "Please enter your weight(kg)".colorize(:green)
      weight = gets.chomp.to_f
      puts "Please enter your height(m), like(1.82)".colorize(:green)
      height = gets.chomp.to_f
      bmi = Bmi.new(weight, height)
      system("clear")
      bmi.display
      option = true
      # if the user chooses to see the history it will disply the history of meal and calorie reords and total of calorie intake
    elsif display_option == "History" && option == true
      user.history
      option = true
    elsif display_option == "Exit" && option == true
      option = false
      exit
    end
    # in this while loop it will ask the user if he wants to check options again, if no it will exit the loops
    option_2 = true
    while option_2 == true
      answer = prompt.select("Would you like to see the options again?", %w(Yes No))
      if answer == "Yes"
        option_2 = false
        system("clear")
      else answer == "No"
        puts "Thank you using this app, please visit us again".colorize(:light_magenta)
        puts ''
        puts "$$$$$$$\ $$\     $$\ $$$$$$$$\ 
$$  __$$\\$$\   $$  |$$  _____|
$$ |  $$ |\$$\ $$  / $$ |      
$$$$$$$\ | \$$$$  /  $$$$$\    
$$  __$$\   \$$  /   $$  __|   
$$ |  $$ |   $$ |    $$ |      
$$$$$$$  |   $$ |    $$$$$$$$\ 
\_______/    \__|    \________|

".colorize(:yellow)      
        exit
      end
  end
end
end






