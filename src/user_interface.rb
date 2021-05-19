require_relative "calorie_recorder.rb"
require_relative "BMI_calculator.rb"


loop do 
  puts "please Enter you name: "
  name = gets.chomp
  user = Calorierecorder.new(name)
  user.welcome
  input = gets.chomp
  break if input != "y"
  option = true
  while option == true && input == "y"
    user.option 
    user_input = gets.chomp.downcase
    if user_input == "calorie" && option == true
      puts "Please enter the type of food: "
      food = gets.chomp
      puts "Please enter the amount of calories: "
      calorie = gets.chomp
      puts "Please enter the time of day:"
      time = gets.chomp
      user.get_calorie(food, calorie, time)
      user.display
      option == true
    elsif user_input == "bmi" && option == true
      puts "Please enter your weight: (kg)"
      weight = gets.chomp.to_f 
      puts "Please enter your height:(m),like(1.75)"
      height = gets.chomp.to_f
      bmi = Bmi.new(weight, height)
      bmi.display
      option = true
    elsif user_input == "history" && option == true
      user.history
      option = true
    else 
      puts "invalid credentials please try again"
      option = true
    end
    while option == true
      puts "Would you like to see the options agin?(Y/N)".colorize(:green)
      answer = gets.chomp
      if answer == "y"
        option = true
        break
      else answer != "y"
        puts "thank you for using our app #{user.name}, good luck!".colorize(:pink)
        option = false
      end
    end
  end
  break
end



