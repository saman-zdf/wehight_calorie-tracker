require 'colorize'
require 'tty-prompt'
require 'terminal-table'
class Greet
  def welcome_msg
    text = "
█░█░█ █▀▀ █░░ █▀▀ █▀█ █▀▄▀█ █▀▀   ▀█▀ █▀█   ▀█▀ █░█ █▀▀   █▀▀ ▄▀█ █░░ █▀█ █▀█ █ █▀▀   █▀█ █▀▀ █▀▀ █▀█ █▀█ █▀▄ █▀▀ █▀█
▀▄▀▄▀ ██▄ █▄▄ █▄▄ █▄█ █░▀░█ ██▄   ░█░ █▄█   ░█░ █▀█ ██▄   █▄▄ █▀█ █▄▄ █▄█ █▀▄ █ ██▄   █▀▄ ██▄ █▄▄ █▄█ █▀▄ █▄▀ ██▄ █▀▄
    "
    ARGV.each do |arg|
      if arg == "cyan"
        puts text.colorize(:cyan)
      elsif arg == "red"
        puts text.colorize(:red)
      elsif arg == "yellow"
        puts text.colorize(:yellow)
      elsif arg == "green"
        puts text.colorize(:green)
      end
    end
    puts "
█░█░█ █▀▀ █░░ █▀▀ █▀█ █▀▄▀█ █▀▀   ▀█▀ █▀█   ▀█▀ █░█ █▀▀   █▀▀ ▄▀█ █░░ █▀█ █▀█ █ █▀▀   █▀█ █▀▀ █▀▀ █▀█ █▀█ █▀▄ █▀▀ █▀█
▀▄▀▄▀ ██▄ █▄▄ █▄▄ █▄█ █░▀░█ ██▄   ░█░ █▄█   ░█░ █▀█ ██▄   █▄▄ █▀█ █▄▄ █▄█ █▀▄ █ ██▄   █▀▄ ██▄ █▄▄ █▄█ █▀▄ █▄▀ ██▄ █▀▄
    ".colorize(:green)
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
# greet = Greet.new
# greet.welcome_msg
