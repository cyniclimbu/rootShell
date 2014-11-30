require 'colored'
require 'highline'
require 'win32ole'
require 'benchmark'
include HighLine::SystemExtensions

=begin
I still don't know how to thread a ruby program so the animation on some methods are 
kind of useless but hey...it works! lol :p
=end

exit if defined?(Ocra)

RootShell = "rootShell"
ERRORMSG = " An unknown error occured.\n Please send an email to cyniclimbu@gmail.com\n Describing what caused it.".cyan
OUTTAATTEMPTS = "OUT OF ATTEMPTS\n   Restart the shell to try again.".bold.red
TIMER = [0.00001,0.00001,0.01,0.002,0,0.0001,0.1,0.1,0.0002,0.0001,0.01,0.0000001]
PERCENTAGE = (1..100)

#--------------------METHOD--------------------# 001 COMPLETED! batch_file_to_admin
def batch_file_to_admin
puts "Making a shell for you :]".bold.green

Dir.chdir ENV['HOME'] + '/desktop'
dir = File.dirname $0
shell = File.basename $0

batch = File.new("rootShell.bat","w")
batch.puts "@echo OFF"
batch.puts "cd #{dir}"
batch.puts "NET SESSION >nul 2>&1"
batch.puts "IF %ERRORLEVEL% EQU 0 ("
batch.puts "    ECHO Starting rootShell as admin!"
batch.puts "    ruby #{shell}"
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
batch.puts "   echo Original version by : https://stackoverflow.com/users/67268/blak3r"
batch.puts "   echo."
batch.puts "   PAUSE"
batch.puts "   EXIT /B 1"
batch.puts ")"
batch.puts "@echo ON"
batch.close

puts " Done!"; puts " Go to desktop, right-click on the batch file "
puts '                and click "Run as administrator"'

sleep 4; exit

end
#--------------------METHOD--------------------# 001 END batch_file_to_admin

=begin
########################################## B O R D E R ##########################################
=end

#--------------------METHOD--------------------# 002 COMPLETED! default_install 
def default_install #DEFAULT_INSTALL C01
time_taken = Benchmark.realtime do #C03
puts " Installing.\n".bold.green
#-------------------------------------------------------------
puts "  Setting variables.".bold.white
$install_path = ENV['home'] + '/desktop'
main_dir = $install_path + '\rootshell'
str_path = "Desktop"

PERCENTAGE.each do |x| #ANIM01
print "\r  #{x}%".bold.white
sleep TIMER[0]
end #END ANIM01
puts "\n  Done!".bold.white
#-------------------------------------------------------------
Dir.chdir $install_path
puts "   Checking for previous installation on this directory.".bold.yellow
if Dir.exists?(RootShell) #C02
rmvdir = system("rmdir /Q /S rootShell")

if not rmvdir == true #IF C0201
puts " Sorry an error occurred.".bold.red
puts " Detected that rootShell system directory exists.".bold.white
puts "          but unfortunately an error occurred when".bold.white
puts "          it tried to delete the directory.".bold.white
puts " MORE TO IT.".bold.green
puts " To fix the problem, please delete the folder manually.".bold.yellow
puts " Maybe it's a bug? If it is send me an email : cyniclimbu@gmail.com".bold.yellow 
end #END C0201
end #END C02

PERCENTAGE.each do |x| #ANIM02
print "\r   #{x}%".bold.yellow
sleep TIMER[5]
end #END ANIM02
puts "\n   Done!".bold.yellow
#-------------------------------------------------------------
puts "    Checking drive".bold.blue
path = Dir.pwd 
drive_regex = /^[(a-z)]:/i #REGEX TO GET FRIST LETTER WITH COLON ':'
						   #IGNOREs CASE
$drive = drive_regex.match(path).to_s #SAVE REGEX MATCH AS STRING

PERCENTAGE.each do |x| #ANIM03
print "\r    #{x}%".bold.blue
sleep TIMER.shuffle.pop
end #END ANIM03

puts "\n    Done!".bold.blue
#-------------------------------------------------------------
puts "     Creating directories on #{str_path}.".bold.cyan
Dir.mkdir(RootShell)
Dir.chdir RootShell

readme = File.new("readme.txt","w")
readme.puts("This folder contains setting configurations.")
readme.puts("Do not edit the setting values unless you know what you're doing.\n\n")
readme.puts("Thanks for downloading rootShell!")
readme.puts("My email - cyniclimbu@gmail.com")
readme.close

Dir.mkdir("user")
Dir.chdir("user")
Dir.mkdir("settings")
#HIDE SETTINGS DIR OT NOT?
Dir.chdir("settings") 
drive = File.new("drive","w")
drive.print($drive); drive.close

PERCENTAGE.each do |x| #ANIM04
print "\r     #{x}%".bold.cyan
sleep TIMER.shuffle.pop
end #END ANIM04

puts "\n     Done!".bold.cyan
#-------------------------------------------------------------
puts " Finished installing!".bold.green
end #END C03
puts " Time taken to install #{time_taken} seconds."
puts " Restart the shell to start using RootShell!"
sleep 4; exit
end #END C01
#--------------------METHOD--------------------# 002 END default_install

=begin
########################################## B O R D E R ##########################################
=end

#--------------------METHOD--------------------# 003 COMPLETED! custom_install 
def custom_install #CUSTOM_INSTALL D01
loop = 0; while loop < 5 #WHILE LOOP D02
puts " Enter desired destination for installation.".bold.green
print " > "
custom_dir = gets.chomp

if custom_dir == "" #IF D03
print " Type something!\n".bold.red
#--------------------------------------------------------
elsif File.file?(custom_dir)
print " #{custom_dir}".bold.white; puts " is not a valid directory.".bold.red
puts " HINT: It's a file god dammit.".bold.cyan
#--------------------------------------------------------
elsif not Dir.exists?(custom_dir) #ELSIF D03
puts " The given directory does not exist.".bold.red
print " #{custom_dir}".bold.green; puts " not found.".bold.red
#--------------------------------------------------------
elsif Dir.exists?(custom_dir) #ELSIF D03
=begin
I literally copied & pasted the codes from below here till D03 from default_install
So all the tags on codes you see is also the same as the one on default_install.
=end
time_taken = Benchmark.realtime do #C03
puts " Installing.\n".bold.green
#-------------------------------------------------------------
puts "  Setting variables.".bold.white
$install_path = custom_dir
main_dir = $install_path + '\rootshell'
str_path = File.basename $install_path

PERCENTAGE.each do |x| #ANIM01
print "\r  #{x}%".bold.white
sleep TIMER[0]
end #END ANIM01
puts "\n  Done!".bold.white
#-------------------------------------------------------------
Dir.chdir $install_path
puts "   Checking for previous installation on this directory.".bold.yellow
if Dir.exists?(RootShell) #C02
rmvdir = system("rmdir /Q /S rootShell")

if not rmvdir == true #IF C0201
puts " Sorry an error occurred.".bold.red
puts " Detected that rootShell system directory exists.".bold.white
puts "          but unfortunately an error occurred when".bold.white
puts "          it tried to delete the directory.".bold.white
puts " MORE TO IT.".bold.green
puts " To fix the problem, please delete the folder manually.".bold.yellow
puts " Maybe it's a bug? If it is send me an email : cyniclimbu@gmail.com".bold.yellow 
end #END C0201
end #END C02

PERCENTAGE.each do |x| #ANIM02
print "\r   #{x}%".bold.yellow
sleep TIMER[5]
end #END ANIM02
puts "\n   Done!".bold.yellow
#-------------------------------------------------------------
puts "    Checking drive".bold.blue
path = Dir.pwd 
drive_regex = /^[(a-z)]:/i #REGEX TO GET FRIST LETTER WITH COLON ':'
						   #IGNOREs CASE
$drive = drive_regex.match(path).to_s #SAVE REGEX MATCH AS STRING

PERCENTAGE.each do |x| #ANIM03
print "\r    #{x}%".bold.blue
sleep TIMER.shuffle.pop
end #END ANIM03

puts "\n    Done!".bold.blue
#-------------------------------------------------------------
puts "     Creating directories on #{str_path}.".bold.cyan
Dir.mkdir(RootShell)
Dir.chdir RootShell

readme = File.new("readme.txt","w")
readme.puts("This folder contains setting configurations.")
readme.puts("Do not edit the setting values unless you know what you're doing.\n\n")
readme.puts("Thanks for downloading rootShell!")
readme.puts("My email - cyniclimbu@gmail.com")
readme.close

Dir.mkdir("user")
Dir.chdir("user")
Dir.mkdir("settings")
#HIDE SETTINGS DIR OT NOT?
Dir.chdir("settings") 
drive = File.new("drive","w")
drive.print($drive); drive.close

PERCENTAGE.each do |x| #ANIM04
print "\r     #{x}%".bold.cyan
sleep TIMER.shuffle.pop
end #END ANIM04

puts "\n     Done!".bold.cyan
#-------------------------------------------------------------
puts " Finished installing!".bold.green
end #END C03
puts " Time taken to install #{time_taken} seconds."
puts " Restart the shell to start using RootShell!"
sleep 4; exit
#--------------------------------------------------------
end #END D03

loop += 1
end #WHILE LOOP END D02
puts " OUT OF ATTEMPTS\n Restart the shell to try again.".bold.red
end #END D01
#--------------------METHOD--------------------# 003 END custom_install 

=begin
########################################## B O R D E R ##########################################
=end

#--------------------METHOD--------------------# 004 NOT COMPLETED
def install #INSTALL B01
#------------------------------------------------
puts " INSTALL".bold.blue
puts " 1 - Default.".bold.green
puts "     Install on desktop.".bold.yellow
puts " 2 - Custom.".bold.green
puts "     Install on custom directory.".bold.yellow
puts " ----------------------------".bold.cyan
puts " It's NEAT & CLEAN either way.".bold.white 

loop = 0; while loop < 7 #WHILE LOOP B02
#------------------------------------------------
print " > "
b01_loop = get_character.chr

if b01_loop == "1" #IF B03
print "1\n".bold.white
default_install
#------------------------------------------------xxxxxx
elsif b01_loop == "2" #ELSIF B03
print "2\n".bold.white
custom_install
#------------------------------------------------xxxxxx
elsif loop == 6 #ELSIF B03
puts OUTTAATTEMPTS
sleep 5; exit
else # ELSE B03
puts "Given character is out of options.".bold.red
end  # ELSE B03
#------------------------------------------------
loop += 1
end #END B02
#------------------------------------------------
end #END B01
#--------------------METHOD--------------------# 002

=begin
########################################## B O R D E R ##########################################
=end

#--------------------METHOD--------------------# 003
def admin? #ADMIN? D01
#--------------------------------------------------------
#DEFINE VARIABLES BEFOREHAND!
reg_key  = 'reg query "HKU\S-1-5-19"'
is_admin = true #system(reg_key) We don't need admin permission for anything right now.

self_name = File.basename $0,".rb" 
self_exe  = self_name + ".exe"
self_rb   = self_name  + ".rb"
#--------------------------------------------------------
if is_admin == true # IF D02
system("cls")
install # M E T H O D
#--------------------------------------------------------
elsif is_admin == false # ELSIF D02
system("cls")

if File.exists?(self_exe) and File.exists?(self_rb) # IF D03
puts "Error, A file with a same name was found on this directory.".bold.red
puts "Please move the copy somewhere else and restart this shell.".bold.red
sleep 4; exit
#--------------------------------------------------------
elsif File.exists?(self_rb) # ELSIF D03
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

batch_file_to_admin # M E T H O D

#------------------------------------------------
elsif choice == 'n' or choice == 'N' # ELSIF D0312
sad_array = ["O","k","a","y"," ",":","("]
sad_array.each do |sad|
print sad.bold.cyan
sleep 0.1
end
sleep 1; exit
#------------------------------------------------
elsif loop == 6 # ELSIF D0312
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
elsif File.exists?(self_exe) # ELSIF D03
							 # IF FILE EXTENSION IS IN .exe OR .EXE
puts " Shell isn't running as administrator.".bold.red
puts " Execute this shell as administrator.".bold.red
sleep 5; exit
#------------------------------------------------
else # ELSE D03 #brtvnckdrtbnvjcs
puts " ERROR, NO FILE WITH '#{self_name}' NAME WAS FOUND.".bold.red
puts " ERROR CODE - A0".bold.red
puts " Try restarting.\n".bold.white
puts " Press 'M' to see more detail information.".bold.white
puts " Press 'E' to exit shell.".bold.white
#------------------------------------------------
loop = 0; while loop < 7 #WHILE LOOP D04 
print " > "
choice = get_character.chr
if choice == 'm' or choice == 'M' # IF D04
puts "\n CODE - A0".bold.red #--# ERROR CODE A0 #--#
puts " A CODE WAS SUPPOSED TO CHECK IF SELF-RUNNING FILE WAS .exe or .rb".bold.green
puts " Possible reason for this error: ".bold.green
puts " 1.The original name of this file was changed!"
puts "    Revert the name if you changed it before."
puts " 2.The extension was changed from .rb to .RB or from .exe to .EXE"
puts "    Revert the extension name if you changed it before."
sleep 4; exit
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
#--------------------METHOD--------------------# 003

admin?
sleep
