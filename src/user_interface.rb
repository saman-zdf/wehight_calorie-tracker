# # require_relative "calorie_recorder.rb"

# class User 
  
#   def welcome
#     puts "Welcome to calorie recorder app"
#     puts "please enter your name: "
#     greet(user_inputs)
#   end

#   def user_inputs
#     gets.chomp.downcase
#   end

#   def greet(name)
#     puts "Fantastic #{name}, would you like to recorde calorie intake or chsck your BMI(body mass index)?(calorie/bmi)"
#     user_selection
#   end
#   # ragarding the user choice, either let user input the calorie intake or calculate BMI
#   # if user input is not part of our demand, give an error message
#   def user_selection
#     user_selection = user_inputs
#     if user_selection == 'calorie'
#       # let user to input the calorie intake, type of food and time of day
#       # give an option to choose again
#       # give an option to exit
#       puts "calorie choice"
#     elsif user_selection == "bmi"
#       # let user to input weight and height to calculate the BMI
#       # give an option to choose again
#       # give an option to exit
#        puts "BMI choice"
#     elsif user_selection == "check"
#       # show the history of calorie intake
#       # give an option to choose again
#       # give an option to exit
#        puts "check choice"
#     else
#       #.invalid credential tru again
#       puts "wrong choice"
#     end
#   end

# end
# # user = User.new
# # user.welcome
# # user.user_inputs
# # name = user.user_inputs

