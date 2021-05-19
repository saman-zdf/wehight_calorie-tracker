require_relative "../calorie_recorder"
require_relative "../BMI_calculator"
require_relative "../user_interface"


# test for Calorierecorder class
describe Calorierecorder do 
    name = "saman"
    calorie = Calorierecorder.new(name)
    # this code is to check if the user get prompt to enter name
    it "display the user to enter their name" do
      expect(calorie.name).to eq(name)
    end
  # this test is for to read the record of calorie
  it "should read the total cal" do
    total_cal = [{food: "chicken", calorie: 300, time: "morning"}]
    expect(calorie.get_calorei("chicken", 300, "morning")).to eq(total_cal)
  end
end

# test for Bmi class
describe Bmi do 
  weight = 70
  height = 1.80
  bmi = Bmi.new(weight, height)
  # this code should read the weight 
  it "shold read the wight" do
    expect(bmi.weight).to eq(weight)
  end
  # this code should read the height 
  it "shold read the wight" do
    expect(bmi.height).to eq(height)
  end

  # this code should calculate and return the bmi
  it "should return the bmi" do
    total_bmi = weight / (height * height)
    expect(bmi.get_bmi).to eq(total_bmi)
  end
end


# test for the user class
describe User do 
  # this test will create the user class
  it "should create the user class" do
    user = User.new
    expect(user).to eq(user)
  end
  # this test will read the user's name 
  it "should read the name" do
    name = "sara"
    user = User.new(name)
    expect(user.name).to eq(name)
  end

end
