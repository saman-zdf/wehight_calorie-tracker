# Welcome to my Calorie recorder App.

## link below is for my github repository:

- you can fork or clone this application from the github repository.
- [Github repository](https://github.com/saman-zdf/weight_calorie-tracker)

## Description:

1. In this app the user can track the daily calorie intakes, the user can check their BMI(Body Mass Index), and if they are under or overweight the app will show how many calories user have to reduce or increase in order to lose or gain weight to get in a normal BMI range. the other feature is if user want sto see the calorie intake history, history would be among the options. in this app there is also another feature that user can get simple random advice.

---

## Instruction for how to use this app and run in your machine:

- If you don't have the Ruby program install on your machine please go to the link below and install the latest version of Ruby

  - [Download and install Ruby](https://rubyinstaller.org/)

- In order to use this app you should have Bundler gem install on your machine, just put the following command and it can be install:
  gem install bundler
- to intall all the gems for this application change directory to the src/ and then simply use the command:
  - bundle install
- All the dependencies you will need are:

  - DEPENDENCIES
  - colorize (~> 0.8.1),
  - json (~> 2.5, >= 2.5.1)
  - rspec (~> 3.10)
  - terminal-table (~> 3.0, >= 3.0.1)
  - tty-prompt

- no you just need go to the src/ directory
- to run the app simply you just need to input the following commandline:

  - ./run_app.sh

- I have implement some command line arguments if you wish to use them you have to run the following commands:
  - ruby user_interface.rb red #=> it gives a red welcome msg, you can also put (cyan, yellow, green) insted of red
- for the next command line argument, user have two option, arguments are (calorierecoder) and (advice)
  - ruby index.rb calorierecorder
  - ruby index.rb advice
    it will let you see the simple random advice or record some calories

---

## Describe at a high level what the application will do:

- The main things this application will do are it will ask you to sign up and create an account, once you signed up it give you an instruction how to use this app, welcome you to this app, the user will have set of options to choose between recording calories, check BMI, see the calories intake history and the last option is user can get a random advice.
  1.  if the user chooses to record the calorie intake it will ask the user to enter the type of food ser had, estimated calories, time of the day, and it will calculate the calories intake and display the user how many calories the user had for a day.
  2.  if the user chooses to check their BMI, it will ask the user to enter their weight and height and the app will calculate their BMI and will show it to them. if user BMI is in a range of 18.5 – 24.9 user BMI is normal and has a healthy weight, if user's BMI is less than or greater than the range it will tell them how to lose or gain weight by estimation.
  3.  if users choose to see their previous calorie records, if it is empty it will display Nothing has reported, if there is a record it will display the user all the records.
  4.  if user choose to ge a random advice it will prompt the user some random advice and it will ask the user if user wants to see the options again.

2. identify the problem it will solve and explain why you are developing it:
   - if a person is underweight or overweight with this app they can manage their daily calorie intake and they would be able to have a healthy weight and it reduce their health risk.
   - the reason I'm developing this app is, there are a lot of people suffering from the above issues and they do not know how to manage to reduce or gain weight, this app will help them to do so.
3. identify the target audience
   - my target audience is people who have a weight problem and need to find a solution for their problem by tracking their food intake. and also the future employee that can show off what I can do to develop an application.
4. explain how a member of the target audience will use it
   - it has a few simple steps that will instruct the users:
     1. user can record their calorie intake and it will display how many calories for a day they had
     2. Users can check to see their BMI, and if it is in a healthy range it will tell them, otherwise, users will get informed if they are under or overweight and give the user some suggestions to gain or lose the weight.
     3. the user will have an option to see his/her previos records.
     ***

## R6: Develop a list of features that will be included in the application. It must include:

- at least THREE features
- describe each feature

Note: Ensure that your features above allow you to demonstrate your understanding of the following language elements and concepts:

- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling

1. In this feature user can create an account to sign-up to the app, I used tty-prompt and used ask and mask built-in method to let the user create an account, when user create a username it will ask the user if the user is sure to continue by the current username otherwise he can create another username, once the user is happy with the current user name user can create a password and it has to be at least 5 characters. I created a class call useraccount and there are a few methods to get username, get password, sign-up andm log-in, I used json to save the user's data. in get username method using a while and using a boolean variable and assign to true. I used conditional statements to ask the user if user is happy with the created user name. when certain condition run which is when user is happy with the username the boolean variable became false in it will break the loop and goes to the next object. same precedure will happen for method call get password, user has to input the password 2 times and if it doesn't match it prompt the user to create another password, I also used conditional statements for this feature.

2. in this feature user can input the data like type of food, number of calories and time of the day, and it will be displayed to the user. .I have created a class call Calorierecorder, this class has initialize method with one argument for name and two instance variables one for name and one for the record, assign the record variable to an empty array to append data from the user inside this array. there is a method call welcome to display the welcome message to the user. there is a method call option that will display the option menu to the user. there is a method call get_data which gets the data from the user to store them inside the record variable array, like the type of the food, number of calories, and time of the day and the user input will get appended to the empty record array as a hash. there is a display_data method and I iterated through the record array to get the value of hash and display it to the user. there is a method call history and I iterated through the array of hash to get value and display it to the user, and with map key word I get the sum of calories value to show to the user how many calories in total the user had.

3. In this feature user can by input weight and height calculate His/Her BMI, I created a class call Bmi and the initialize method has to arguments one for weight and one for height, there is a method call get_bmi which can calculate the BMI of the user by dividing the weight to the exponent of height. there is a method call display that will display the BNI to the user, I used conditional statements if the user's BMI in a normal range it will display a message that the user has a healthy weight, if it is not it will let the user know that BMI is not in a normal range.

# R7: Develop an outline of the user interaction and experience for the application.

---

- how errors will be handled by the application and displayed to the use

- For using this application there are set of instruction that user has to follow.

1. At first the application will prompt the user welcome message and it will ask the user for He/Her name, after user input name, the application will greet the user and will ask the user if the user wants to use on of the three options that application provide.

2. The user can interact by choosing on of the following option(calorie, BMI, History). if user choose calorie it will ask the user to put the type of food, estimated calorie, time of the day, once the user input the these request it will be recorded in display the user the information. if user choose to calculate BMI(body mass index), it will ask the user to input weight and height and it will display the BMI of user, if user's BMI in the range of normal it will dispaly user have a healthy range, if BMI is not in a normal range it will let the user know He either is overweight or underweight, if user choose to see the history, it will show the history of calorie intake.

3. for error handling, for example if user choose to check their BMI, it will ask the user top input weight and height , and if the inputs are not valid number it will prompt the user to put a valid number. or if user to choose log-in with the existing account if user input the wrong information it will prompt the user the account hasn't exist, please try again.

---

# R8: A diagram to describe the control flow of application

![diagram](./docs/flowchart.png)

---

# R9: project mangement using trello

I used trello as a project management, to set a plan of what I want to do, set goals, create a user story and checked if my feature meet the expectation of user. made a to list, list of features, testing, process, complete, and sat time to do each feature, you can vist the link below to see the steps I took in order to build this app:

- [Porject management](https://trello.com/b/qfquUDvI/newcaloriebmitracker)

1. DAY 1
   ![Project management](./docs/1_trello.png)
2. DAY 2
   ![Project management](./docs/2_trello.png)
   ![Project management](./docs/3_trello.png)
   ![Project management](./docs/trello-1.png)
   ![Project management](./docs/trello-2.png)

   ***

   ### Testin record

   1. I tested ever class and methods inside of the class and recorder in the spreadsheets:
      ![Test records](docs/test-1.png)
      ![Test records](docs/test-2.png)
      ![Test records](docs/test-3.png)

---
