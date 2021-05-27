require 'colorize'
require 'tty-prompt'
require 'terminal-table'
require "httparty"
require_relative "bmi.rb"
require_relative "calorie_recorder.rb"
require_relative "greet.rb"
require_relative "sign_up.rb"
require_relative "api.rb"
prompt = TTY::Prompt.new
ARGV.each do |arg|
  status_input = false
  case arg
  when "calorierecorder"
    until status_input do
      greet = Greet.new
      greet.welcome_msg
    calorie = Calorierecorder.new("Anyone")
    calorie.calorie_recorder
    calorie.display_data
    input = prompt.select("would you like to record again?", %W(Yes No) )
    if input == "Yes"
      status_input = false
      system("clear")
    else 
      status = true
      exit
    end
  end
  when "advice" 
    advice = Api.new
    advice.get_advice
end
end
