require 'colorize'
require 'tty-prompt'
require 'terminal-table'
class Greet
  def welcome_msg
      puts " 
█░█░█ █▀▀ █░░ █▀▀ █▀█ █▀▄▀█ █▀▀   ▀█▀ █▀█   ▀█▀ █░█ █▀▀   █▀▀ ▄▀█ █░░ █▀█ █▀█ █ █▀▀   █▀█ █▀▀ █▀▀ █▀█ █▀█ █▀▄ █▀▀ █▀█
▀▄▀▄▀ ██▄ █▄▄ █▄▄ █▄█ █░▀░█ ██▄   ░█░ █▄█   ░█░ █▀█ ██▄   █▄▄ █▀█ █▄▄ █▄█ █▀▄ █ ██▄   █▀▄ ██▄ █▄▄ █▄█ █▀▄ █▄▀ ██▄ █▀▄
".colorize(:cyan)
  end

  def bye_msg
       puts "Thank you for visiting us, please come back again".colorize(:cyan)
      puts ""
        puts "
█▄▄ █▄█ █▀▀
█▄█ ░█░ ██▄".colorize(:cyan)
          puts ''
  end
end
