require "httparty"
require 'colorize'
# creating class to getting the api
class Api 
  include HTTParty
  base_uri "api.adviceslip.com/"
# create a method call get advice, store a data in file vasriables and get advice with paresed_response
  def get_advice
    system("clear")
    data = self.class.get("/advice").parsed_response
    50.times do print "*".colorize(:yellow) end
      puts ''
      # using error handling if there is a problem for calling api it will handle the error to the user and user can try again
      begin
    puts JSON.parse(data)["slip"]["advice"].colorize(:cyan)
      rescue
        puts "There is a problem with api, please try again in a few seconds"
      end

    50.times do print "*".colorize(:yellow) end
      puts ''
  end

end

