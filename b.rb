require 'colored'
require 'highline'
require 'win32ole'

include HighLine::SystemExtensions

RootShell = "rootShell"
ERRORMSG = " An unknown error occured.\n Please send an email to cyniclimbu@gmail.com\n Describing what caused it.".bold.cyan
OUTTAATTEMPTS = "OUT OF ATTEMPTS\n   Restart the shell to try again.".bold.white


#--------------------METHOD--------------------# 001
def run_rootShell_as_admin
puts "Making a shell for you :]".bold.green

Dir.chdir ENV['HOME'] + '/desktop'
dir = File.dirname $0
shell = File.basename $0

batch = File.new("rootShell.bat","w")
batch.puts "@echo OFF"
batch.puts "cd #{dir}"
batch.puts "NET SESSION >nul 2>&1"
batch.puts "IF %ERRORLEVEL% EQU 0 ("
batch.puts "    ECHO Administrator PRIVILEGES Detected!"
batch.puts "    echo Starting rootShell as admin!"
batch.puts "    ruby #{shell}"
batch.puts "    ####"
batch.puts "    PAUSE"
batch.puts ") ELSE ("
batch.puts "   echo ######## ########  ########   #######  ########  "
batch.puts "   echo ##       ##     ## ##     ## ##     ## ##     ## "
batch.puts "   echo ##       ##     ## ##     ## ##     ## ##     ## "
batch.puts "   echo ######   ########  ########  ##     ## ########  " 
batch.puts "   echo ##       ##   ##   ##   ##   ##     ## ##   ##   "
batch.puts "   echo ##       ##    ##  ##    ##  ##     ## ##    ##  "
batch.puts "   echo ######## ##     ## ##     ##  #######  ##     ## "
batch.puts "   echo."
batch.puts "   echo."
batch.puts "   echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########"
batch.puts "   echo This script must be run as administrator to work   "
batch.puts '   echo Right click on my file icon and select "Run As Administrator".'
batch.puts "   echo ##########################################################"
batch.puts "   echo Made by : https://stackoverflow.com/users/67268/blak3r"
batch.puts "   echo Thanks man!"
batch.puts "   echo."
batch.puts "   PAUSE"
batch.puts "   EXIT /B 1"
batch.puts ")"
batch.puts "@echo ON"
batch.close

puts " Done!".bold.white; puts " Go to desktop, right-click on the batch file ".bold.green
puts '                and click "Run as administrator"'.bold.green



end
#--------------------METHOD--------------------# 001

#--------------------#----#--------------------#

#--------------------METHOD--------------------# 002
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
#------------------------------------------------xxxxxx
puts "do default_install" #def default_install ... end
#------------------------------------------------xxxxxx
elsif b01_loop == "2"
#------------------------------------------------xxxxxx
puts "do custom_install" #def custom_install ... end
#------------------------------------------------xxxxxx
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
#--------------------METHOD--------------------# 002



def admin? #ADMIN? D01

reg_key  = 'reg query "HKU\S-1-5-19"'
is_admin = system(reg_key)

if is_admin == true # IF D02
system("cls")
install # M E T H O D
#--------------------------------------------------------
elsif is_admin == false # ELSIF D02
system("cls")
#--------------------------------------------------------
if $0 =~ /.rb\z/i # IF D03
				  # IF FILE EXTENSION IS IN .rb OR .RB 
puts " Installer must run as administrator to begin.\n"
puts "\n Message from my creator :D".bold.cyan
puts " I can just create a batch file for you to run it as administrator.".bold.cyan
puts " And save it to desktop, if you want?".bold.cyan
puts " Press 'Y' is yes :) and 'N' if you don't like me. :(".bold.cyan

loop = 0; while loop < 7 # WHILE LOOP D031
print " > "
choice = get_character.chr

if choice == 'y' or choice == 'Y' # IF D0312
#------------------------------------------------

run_rootShell_as_admin # M E T H O D

#------------------------------------------------
elsif choice == 'n' or choice == 'N' # ELSIF D0312
sad_array = ["O","k","a","y"," ",":","("]
sad_array.each do |sad|
print sad.bold.cyan
sleep 0.1
end
sleep 1; exit
#------------------------------------------------
elsif loop == 6
puts OUTTAATTEMPTS
sleep 4; exit
#------------------------------------------------
else  # ELSE D0312
puts "Given character is out of option.".bold.red
#------------------------------------------------
end  # END D0312
#------------------------------------------------
loop += 1
end # END D031
#------------------------------------------------
elsif $0 =~ /.exe\z/i # ELSIF D03
					  # IF FILE EXTENSION IS IN .exe OR .EXE
puts " Shell isn't running as administrator.".bold.red
puts " Execute this shell as administrator.".bold.red
sleep 5; exit
#------------------------------------------------
else # ELSE D03
puts " ERROR, REGEX FAILED OR RETURNED NIL ON .rb OR .exe".bold.red
puts " ERROR CODE - A0".bold.red
puts " Try restarting.".bold.white
puts "         OR"
puts " Contact - cyniclimbu@gmail.com".bold.cyan

puts " Press 'M' to see more detail information.".bold.white
puts " Press 'E' to exit shell.".bold.white
#------------------------------------------------
loop = 0; while loop < 7 #WHILE LOOP D04 
print " > "
choice = get_character.chr
if choice == 'm' or choice == 'M' # IF D04
puts "\n CODE - A0".bold.red
puts " A REGEX IS SUPPOSED TO PICKUP THE FILE EXTENSION.".bold.green
puts " OF THIS FILE AND FIGURE OUT IF IT's .rb or .exe (case insensitive)".bold.green
puts " JUST SEND ME AN E-MAIL, ALLRIGHT? :)".bold.white
#------------------------------------------------
elsif choice == 'e' or choice == 'E' # ELSIF D04
bye = ["B","y","e"," ","b","y","e","!"]
bye.each do |exitmsg|
print exitmsg.bold.magenta 
sleep 0.1
end
sleep 1; exit
#------------------------------------------------
elsif loop == 6 # ELSIF D04
puts OUTTAATTEMPTS
sleep 4; exit
#------------------------------------------------
else #END OF D04
puts "Given character is out of option.".bold.red
end # END D04 
#------------------------------------------------
loop += 1
end # END D04
#------------------------------------------------
end # END D03
#--------------------------------------------------------
else # ELSE D02
puts ERRORMSG
end # END D02



end  #END D01

admin?
sleep
