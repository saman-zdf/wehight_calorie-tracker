require 'colorize'
require 'tty-prompt'
require 'terminal-table'
require 'json'
# create a user account class for username and password
class UserAccount 
  attr_reader :username
  @@prompt = TTY::Prompt.new
  #create a method that will prompt the user at the beginig if he wants to signup or exit, useing tty-promt select to collect the user answer
  def sign_up
    prompt = @@prompt.select("Would you like to sign-up or exit", %W(Sign-Up Log-In Exit))
  end

# # create a method to prompt the username to create password, inside this method using while loop and asking user to create a username, and then prompt the user usi if user is happy with the chosen username and using conditional statements to collect he user answer.
  def get_useranme
    status = true
    while status == true
      @username = @@prompt.ask("Create a username:")
      question = @@prompt.select("you created #{@username}, are you sure?") do |opt|
        opt.choice "Yes"
        opt.choice "No"
      end
      if question == "Yes"
        status = false
        break
        system("clear")
      else question == "No"
        status = true
      end
    end
  end
# # in this methos asking user to create a password and retype the password if the password doesn't match, the user will be asked to create a password again, again usin while loop, while the status variables is true a certain condition with conditional staements has to happen.
  def get_password
    status = true
    while status == true
    @password = @@prompt.mask("Create a password with at least 5 character") do |q|
      q.validate(/[a-z\ ]{5,15}/)
    end
    @password_2 = @@prompt.mask("Retype your password") do |q|
      q.validate(/[a-z\ ]{5,15}/)
    end
      if @password == @password_2
        system("clear")
        status = false 
        break
      else @password != @password_2
        puts "Wrong password, try again".colorize(:red)
        status = true
      end
    end
  end

  def get_account 
    @user = {}
    @user[@username] = @password
    data = []
    data << File.write('test_2.json', JSON.dump(@user))
  end

  def log_in
    authentication = true
    while authentication
      @username = @@prompt.ask("Please enter your username:")
      @password = @@prompt.mask("Please enter your password") do |q|
        q.validate(/[a-z\ ]{5,15}/)
      end
      user = {}
      user[@username] = @password
      file = File.read('./test_2.json')
      data_hash = JSON.parse(file)
    if data_hash == user
      authentication = false
      system("clear")
      puts "Welcome back #{@username}"
      keypress = @@prompt.keypress("Press any key to continue")
      system("clear")
      break
    else
      puts "this account hasn't exist, please try again."
      authentication = true
    end
  end
  end

#   # displaying user the username successfully has been created, and then using keypress from tty-prompt to pree any key yo continue,
  def confirm_account
    puts "Congratulation you created an account, and your user name is #{@username}."
    keypress = @@prompt.keypress("Press any key to continue")
    system("clear")
  end

end

