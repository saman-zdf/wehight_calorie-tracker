require "httparty"
require 'colorize'

class Api 
  include HTTParty
  base_uri "api.adviceslip.com/"

  def get_advice
    puts self.class.get("/advice").colorize(:cyan)  
  end

end

