require 'colored'
require 'highline'
require 'win32ole'

include HighLine::SystemExtensions

RootShell = "rootShell"
ERRORMSG = " An unknown error occured.\n Please send an email to cyniclimbu@gmail.com\n Describing what caused it.".cyan
OUTTAATTEMPTS = "OUT OF ATTEMPTS\n   Restart the shell to try again.".white_on_black

def install #INSTALL B01
#------------------------------------------------
puts " INSTALL".bold.blue
puts " 1 - Default.".bold.green
puts "     Install on desktop.".bold.green
puts " 2 - Custom.".bold.green
puts "     Install on custom directory.".bold.yellow
puts " ----------------------------".bold.cyan
puts " It's NEAT & CLEAN either way.".bold.white 

loop = 0; while loop < 7 #WHILE LOOP B02
#------------------------------------------------
print " > "
b01_loop = get_character.chr

if b01_loop == "1" #IF B03
puts "do default_install" #def default_install ... end
#------------------------------------------------
elsif b01_loop == "2"
puts "do custom_install" #def custom_install ... end
#------------------------------------------------



elsif loop == 6
puts OUTTAATTEMPTS
sleep 5; exit
else # ELSE B03
puts "Given character is out of options.".red_on_black
end  # ELSE B03
#------------------------------------------------
loop += 1
end #END B02
#------------------------------------------------
end #END B01


install
sleep