require 'colorize'
require 'tty-prompt'
require 'terminal-table'
class Greet
  def welcome_msg
      puts " 
█░█░█ █▀▀ █░░ █▀▀ █▀█ █▀▄▀█ █▀▀   ▀█▀ █▀█   ▀█▀ █░█ █▀▀   █▀▀ ▄▀█ █░░ █▀█ █▀█ █ █▀▀   █▀█ █▀▀ █▀▀ █▀█ █▀█ █▀▄ █▀▀ █▀█
▀▄▀▄▀ ██▄ █▄▄ █▄▄ █▄█ █░▀░█ ██▄   ░█░ █▄█   ░█░ █▀█ ██▄   █▄▄ █▀█ █▄▄ █▄█ █▀▄ █ ██▄   █▀▄ ██▄ █▄▄ █▄█ █▀▄ █▄▀ ██▄ █▀▄
".colorize(:yellow)
  end

  def bye_msg
       puts "Thank you for visiting us, please come back again".colorize(:cyan)
      puts ""
        puts "$$$$$$$\ $$\     $$\ $$$$$$$$\ 
$$  __$$\\$$\   $$  |$$  _____|
$$ |  $$ |\$$\ $$  / $$ |      
$$$$$$$\ | \$$$$  /  $$$$$\    
$$  __$$\   \$$  /   $$  __|   
$$ |  $$ |   $$ |    $$ |      
$$$$$$$  |   $$ |    $$$$$$$$\ 
\_______/    \__|    \________|
          ".colorize(:yellow)
         15.times do  print "\xF0\x9F\x8C\xB2" end
          puts ''
  end
end
