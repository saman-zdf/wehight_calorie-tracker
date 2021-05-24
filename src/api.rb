require "httparty"
require 'colorize'
# creating class to getting the api
class Api 
  include HTTParty
  base_uri "api.adviceslip.com/"
# create a method call get advice
  def get_advice
    data = self.class.get("/advice").parsed_response
    50.times do print "*".colorize(:yellow) end
      puts ''
    puts JSON.parse(data)["slip"]["advice"].colorize(:cyan)
    50.times do print "*".colorize(:yellow) end
      puts ''
  end

end


