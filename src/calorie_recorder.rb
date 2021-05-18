class Calorierecorder 
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def display
    puts "Hey #{@name}, welcome to me app"
  end
end

