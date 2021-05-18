require_relative "../calorie_recorder"
require_relative "../BMI_calculator"
require_relative "../weight"

describe Calorierecorder do 
    calorie = Calorierecorder.new(name)
    # this code is to check if the user get prompt to enter name
    it "display the user to enter their name" do
    name = "saman"
    expect(calorie.name).to eq(name)
  end
end
