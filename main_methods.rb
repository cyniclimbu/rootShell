require 'colored'
require 'highline'
require 'win32ole'
require 'benchmark'
include HighLine::SystemExtensions


=begin
methods of option 1 and option 2 should sleep from within the method because this method does not provide sleep 
for them

I still don't know how to thread a ruby program so the animation on methods are
kind of useless but hey...it works! lol :p

windows dir - c:\windows\seewhyaneyesee 
path file - path 

default install:
main_dir = $install_path + '\rootshell'
$install_path = ENV['home'] + '/desktop'


custom install:
main_dir = $install_path + '\rootshell'
$install_path = custom_dir

rootshell:
rootshell\user\settings
=end

exit if defined?(Ocra)

RootShell = "rootShell"
ERRORMSG = " An unknown error occured.\n Please send an email to cyniclimbu@gmail.com\n Describing what caused it.".bold.cyan
OUTTAATTEMPTS = "OUT OF ATTEMPTS\n   Restart the shell to try again.".bold.white
TIMER = [0.00001,0.00001,0.01,0.001,0,0.0001,0.1,0.1,0.0001,0.0001,0.01,0.0000001]
PERCENTAGE = (1..100)



#--------------------METHOD--------------------# 001
def admin? #ADMIN? D01
#--------------------------------------------------------
#DEFINE VARIABLES BEFOREHAND!
reg_key  = 'reg query "HKU\S-1-5-19"'
$is_admin = system(reg_key)

self_name = File.basename $0,".rb" 
self_exe  = self_name + ".exe"
self_rb   = self_name  + ".rb"
#--------------------------------------------------------
if $is_admin == true # IF D02
system("cls")
installer # M E T H O D
#--------------------------------------------------------
elsif $is_admin == false # ELSIF D02
system("cls")

if File.exists?(self_exe) and File.exists?(self_rb) # IF D03
puts " A file with a same name was found on this directory.".bold.cyan
puts " Please move the copy somewhere else and restart this shell.".bold.red
puts " ERROR - POSSIBLE CONFLICT CAN OCCUR.".bold.yellow
sleep 4; exit
#--------------------------------------------------------
elsif File.exists?(self_rb) # ELSIF D03
							# IF FILE EXTENSION IS IN .rb OR .RB 
puts " Shell must run as administrator to begin.\n"
puts "\n Message from my creator :D".bold.cyan
puts " I can create a batch file for you to run it as administrator.".bold.cyan
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
exe_not_admin = %w(S h e l l \ i s \ n o t \ r u n n i n g \ a s \ a d m i n .)
exe_not_admin.each do |x|
print x.bold.red
sleep 0.02
end
puts "\n"
exe_not_admin = %w(P l e a s e \ s t a r t \ t h i s \ s h e l l \ a s \ a d m i n i s t r a t o r .)

exe_not_admin.each do |x|
print x.bold.white
sleep 0.03
end
sleep 4; exit
#------------------------------------------------
else # ELSE D03
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

bye = %w(B y e \ B y e !)
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
#--------------------METHOD--------------------# 001
=begin

########################################## B O R D E R ##########################################

=end

#--------------------METHOD--------------------# 002 COMPLETED! batch_file_to_admin
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
#--------------------METHOD--------------------# 002 END batch_file_to_admin

=begin

########################################## B O R D E R ##########################################

=end

#--------------------METHOD--------------------# 003 COMPLETED! default_install 
def default_install #DEFAULT_INSTALL C01
time_taken = Benchmark.realtime do #C03
puts " Installing.\n".bold.green
#-------------------------------------------------------------
puts "  Setting variables.".bold.white
$install_path = ENV['home'] + '\desktop'
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
sleep 0.5
if rmvdir != true or Dir.exists?(RootShell) #IF C0201
puts " Sorry an error occurred.".bold.red
puts " Detected that rootShell system directory exists.".bold.white
puts "          but unfortunately an error occurred when".bold.white
puts "          it tried to delete the directory.".bold.white
puts " MORE TO IT.".bold.green
puts " To fix the problem, please delete the folder manually.".bold.yellow
puts " Maybe it's a bug? If it is send me an email : cyniclimbu@gmail.com".bold.yellow 
puts "\n Installation failed and was aborted.".bold.cyan
sleep 4; exit
end #END C0201
end #END C02

PERCENTAGE.each do |x| #ANIM02
print "\r   #{x}%".bold.yellow
sleep TIMER[10]
end #END ANIM02
puts "\n   Done!".bold.yellow
#-------------------------------------------------------------
puts "    Checking drive".bold.blue
path = Dir.pwd 
drive_regex = /^[(a-z)]:/i #REGEX TO GET FRIST LETTER WITH COLON ':'
						   #IGNOREs CASE
$drive = drive_regex.match(path).to_s #SAVE REGEX MATCH AS STRING
windows = $drive + '\windows'

PERCENTAGE.each do |x| #ANIM03
print "\r    #{x}%".bold.blue
sleep TIMER.shuffle.pop
end #END ANIM03

puts "\n    Done!".bold.blue
#-------------------------------------------------------------
puts "     Creating directories on #{str_path} and c:\\windows".bold.cyan
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


if Dir.exists?(windows) #IF E01
Dir.chdir windows

if Dir.exists?("seewhyaneyesee") #IF E02
Dir.chdir "seewhyaneyesee"
paths = File.new("path","w")
paths.puts(main_dir)
paths.puts($install_path)
paths.close

elsif not Dir.exists?("seewhyaneyesee")
Dir.mkdir("seewhyaneyesee")
Dir.chdir "seewhyaneyesee"
paths = File.new("path","w")
paths.puts(main_dir)
paths.puts($install_path)
paths.close

end #END E02


else #ELSE E01
print " Error, could not find ".bold.red; puts "#{windows}".bold.white
puts " This won't cause rootShell to stop working.".bold.cyan
puts " You will have two choices.".bold.green
puts " 1. To put the shell and it's system folder in the same directory.".bold.yellow
puts " 2. Type the system folder's path onto the shell every time it loads.\n".bold.yellow
end #END E01

PERCENTAGE.each do |x| #ANIM04
print "\r     #{x}%".bold.cyan
sleep TIMER.shuffle.pop
end #END ANIM04

puts "\n     Done!".bold.cyan
#-------------------------------------------------------------
puts " Finished installing!".bold.green
end #END C03
print " Time taken to install "; print "#{time_taken}".bold.yellow ; puts " seconds."
puts " Restart the shell to start using RootShell!"
sleep 4; exit
end #END C01
#--------------------METHOD--------------------# 003 END default_install

=begin

########################################## B O R D E R ##########################################

=end

#--------------------METHOD--------------------# 004 COMPLETED! custom_install 
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
sleep 0.5
if rmvdir != true or Dir.exists?(RootShell) #IF C0201
puts " Sorry an error occurred.".bold.red
puts " Detected that rootShell system directory exists.".bold.white
puts "          but unfortunately an error occurred when".bold.white
puts "          it tried to delete the directory.".bold.white
puts " MORE TO IT.".bold.green
puts " To fix the problem, please delete the folder manually.".bold.yellow
puts " Maybe it's a bug? If it is send me an email : cyniclimbu@gmail.com".bold.yellow 
puts "\n Installation failed and was aborted.".bold.cyan
sleep 4; exit
end #END C0201
end #END C02

PERCENTAGE.each do |x| #ANIM02
print "\r   #{x}%".bold.yellow
sleep TIMER[10]
end #END ANIM02
puts "\n   Done!".bold.yellow
#-------------------------------------------------------------
puts "    Checking drive".bold.blue
path = Dir.pwd 
drive_regex = /^[(a-z)]:/i #REGEX TO GET FRIST LETTER WITH COLON ':'
						   #IGNOREs CASE
$drive = drive_regex.match(path).to_s #SAVE REGEX MATCH AS STRING
windows = $drive + '\windows'

PERCENTAGE.each do |x| #ANIM03
print "\r    #{x}%".bold.blue
sleep TIMER.shuffle.pop
end #END ANIM03

puts "\n    Done!".bold.blue
#-------------------------------------------------------------
puts "     Creating directories on #{str_path} and c:\\windows".bold.cyan
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


if Dir.exists?(windows) #IF E01
Dir.chdir windows

if Dir.exists?("seewhyaneyesee") #IF E02
Dir.chdir "seewhyaneyesee"
paths = File.new("path","w")
paths.puts(main_dir)
paths.puts($install_path)
paths.close

elsif not Dir.exists?("seewhyaneyesee")
Dir.mkdir("seewhyaneyesee")
Dir.chdir "seewhyaneyesee"
paths = File.new("path","w")
paths.puts(main_dir)
paths.puts($install_path)
paths.close

end #END E02


else #ELSE E01
print " Error, could not find ".bold.red; puts "#{windows}".bold.white
puts " This won't cause rootShell to stop working.".bold.cyan
puts " You will have two choices.".bold.green
puts " 1. To put the shell and it's system folder in the same directory.".bold.yellow
puts " 2. Type the system folder's path onto the shell every time it loads.\n".bold.yellow
end #END E01

PERCENTAGE.each do |x| #ANIM04
print "\r     #{x}%".bold.cyan
sleep TIMER.shuffle.pop
end #END ANIM04

puts "\n     Done!".bold.cyan
#-------------------------------------------------------------
puts " Finished installing!".bold.green
end #END C03
print " Time taken to install "; print "#{time_taken}".bold.yellow ; puts " seconds."
puts " Restart the shell to start using RootShell!"
sleep 4; exit
#--------------------------------------------------------
end #END D03

loop += 1
end #WHILE LOOP END D02
puts " OUT OF ATTEMPTS\n Restart the shell to try again.".bold.red
end #END D01
#--------------------METHOD--------------------# 004 END custom_install 

=begin

########################################## B O R D E R ##########################################

=end




def locate_rootshell #METHOD LOCATE_ROOTSHELL F01

=begin
BELOW SEARCH_MULTIPLE
=end



def search_multiple #F04
=begin

=end

def search_in_dir #METHOD SEARCH_IN_DIR SBM01
smalltimer = [0.00001, 0.00000001, 0.00000002, 0.0000001, 0.0000001, 0.000001, 0.00003]
puts " Checking directories.".bold.green
(1..100).each do |x|
print "\r #{x}%".bold.green
sleep smalltimer.shuffle.pop

end
puts "\n"
check_path_for_rootshell = Thread.new {

$paths.each do |x| #F05

if Dir.exists?(x)#IF F06
Dir.chdir(x) 
if Dir.exists?("rootShell") # IF F07
puts "\n Success!".bold.green
print " rootShell ".bold.cyan; print "was "; print "found ".bold.green; print "in "; puts "#{x}".bold.yellow
install_path = x
main_dir = install_path + '\rootshell'
=begin

=end

if defined?($is_admin) #IF F08

if $is_admin == true #IF F09
path = Dir.pwd 
drive_regex = /^[(a-z)]:/i
drive = drive_regex.match(path).to_s 
windows = drive + '\windows'

if Dir.exists?(windows) # IF F10
Dir.chdir(windows)

if Dir.exists?("seewhyaneyesee") # IF F11
Dir.chdir("seewhyaneyesee")

createFile = File.new("path","w")
createFile.puts(main_dir)
createFile.puts(install_path)
createFile.close

elsif not Dir.exists?("seewhyaneyesee") # ELSIF F11
Dir.mkdir("seewhyaneyesee")
Dir.chdir("seewhyaneyesee")

createFile = File.new("path","w")
createFile.puts(main_dir)
createFile.puts(install_path)
createFile.close

else # ELSE F11
puts ERRORMSG 
end # END F11


puts " Finished writing new changes."
puts " Restart the shell for changes to take effect."
sleep 5; exit

elsif not Dir.exists?(windows) # ELSIF F10
puts "#{windows} was not found.".bold.red
puts "I'm still thinking about what to do here.".bold.cyan
puts "Sorry, There is no fix for this at the moment.".bold.cyan
puts "If you want it sorted out, send me an email at cyniclimbu@gmail".bold.cyan
=begin
Work on this
Whether to ask user where windows is and find a safe dir to save it somewhere again like you save 
seewhyaneyesee on c:\windows or just leave it as it is and give the user an error.
=end
else # ELSE F10
puts ERRORMSG

end # END F10

elsif $is_admin == false #ELSIF F09


else #ELSE F09
puts " Error, a variable that checks if this shell is running as administrator".bold.red
puts " Has an incorrect type of value.".bold.red
puts "\n Why am I seeing this?".bold.green
puts " Because someone changed the value of a global variable known as 'is_admin'".bold.cyan
puts " If you didn't, please check the source code.".bold.cyan
puts " If you're using .exe version of this shell please report to ".bold.cyan
puts " Email: cyniclimbu@gmail.com\n".bold.cyan
system("pause")
exit
end #END F09


else #ELSE F08
print " I have a"; print " good ".bold.green; print "news and a "; print "bad ".bold.red; puts "news."
print " Good news ".bold.green; puts ": rootShell was found.".bold.yellow
print " Bad news  ".bold.red; puts ": I cannot make changes on setting file".bold.yellow
puts  "             as this shell isn't running as administrator.\n".bold.yellow
puts "\n What can I do about it?".bold.green
puts " All you can do is restart the shell as administrator.\n".bold.cyan
puts " MORE TO IT.".bold.green
puts " The shell checks if it's running as administrator when it starts.".bold.cyan
puts " You are seeing this message because you played with the source code.".bold.cyan
puts " Or if you didn't do anything but saw this please report to".bold.cyan
puts " Email: cyniclimbu@gmail".bold.cyan
system("pause"); exit
end #END F08


elsif not Dir.exists?("rootShell") # ELSIF F07
print " rootShell ".bold.cyan; print "was "; print "not found".bold.red; print " in "; puts "#{x}".bold.yellow
end # END F07

elsif x == "EnD"
nil
elsif x.empty? #ELSIF F06
puts " Empty input is not a directory.".bold.red

elsif not Dir.exists?(x) #ELSIF F06
print " #{x} ".bold.yellow; print "does not".bold.red; puts " exist.".bold.green
else #IF F06
puts " #{x} was not recognized as a valid input."
puts " Maybe a bug!".bold.red
puts ERRORMSG.bold.cyan
end #END F06

end #F05
}
check_path_for_rootshell.join

end #END OF SUB-METHOD SEARCH_IN_DIR SBM01

#----------------------------------------------------------------
#================================================================
#----------------------------------------------------------------

puts " Provide paths.".bold.green
puts " Type EnD [Case sensitive.] to stop."
$paths = []
multiple_path_loop = 0; while multiple_path_loop < 5

print " > ".bold.green
multiple_paths = gets.chomp
$paths.push multiple_paths

if $paths.length == 1 and multiple_paths == "EnD"
puts " You did not provide any directories before 'EnD'ing".bold.green
puts " Shell is now quitting. 4 Seconds.".bold.green
sleep 4; exit
 
elsif multiple_paths == "EnD"
#--------------------------------------------
search_in_dir
system("pause"); exit
#--------------------------------------------
end

multiple_path_loop += 1
end

#------------------------------------------------
search_in_dir
system("pause"); exit
#------------------------------------------------
end #F04



=begin
BETWEEN SEARCH_MULTIPLE
=end



def search_specific #SUB-METHOD SBM02
puts " Provide path where rootShell is.".bold.green

loop = 0; while loop < 5 # WHILE LOOP G01
print " > ".bold.white
path = gets.chomp

if Dir.exists?(path) # IF G02
Dir.chdir(path)

if Dir.exists?(RootShell)# IF G03
puts " Success!".bold.green
print " rootShell "; print "found ".bold.green; print "in "; puts "#{path}".bold.yellow
install_path = path
main_dir = install_path + '\rootshell'

if defined?($is_admin) #IF F08

if $is_admin == true #IF F09
path = Dir.pwd 
drive_regex = /^[(a-z)]:/i
drive = drive_regex.match(path).to_s 
windows = drive + '\windows'

if Dir.exists?(windows) # IF F10
Dir.chdir(windows)

if Dir.exists?("seewhyaneyesee") # IF F11
Dir.chdir("seewhyaneyesee")

createFile = File.new("path","w")
createFile.puts(main_dir)
createFile.puts(install_path)
createFile.close

elsif not Dir.exists?("seewhyaneyesee") # ELSIF F11
Dir.mkdir("seewhyaneyesee")
Dir.chdir("seewhyaneyesee")

createFile = File.new("path","w")
createFile.puts(main_dir)
createFile.puts(install_path)
createFile.close

else # ELSE F11
puts ERRORMSG 
end # END F11

puts " Finished writing new changes.".bold.green
puts " Restart the shell for changes to take effect.".bold.green
sleep 5; exit

elsif not Dir.exists?(windows) # ELSIF F10
puts "#{windows} was not found.".bold.red
puts "I'm still thinking about what to do here.".bold.cyan
puts "Sorry, There is no fix for this at the moment.".bold.cyan
puts "If you want it sorted out, send me an email at cyniclimbu@gmail".bold.cyan
=begin
Work on this
Whether to ask user where windows is and find a safe dir to save it somewhere again like you save 
seewhyaneyesee on c:\windows or just leave it as it is and give the user an error.
=end
else # ELSE F10
puts ERRORMSG

end # END F10

elsif $is_admin == false #ELSIF F09


else #ELSE F09
puts " Error, a variable that checks if this shell is running as administrator".bold.red
puts " Has an incorrect type of value.".bold.red
puts "\n Why am I seeing this?".bold.green
puts " Because someone changed the value of a global variable known as 'is_admin'".bold.cyan
puts " If you didn't, please check the source code.".bold.cyan
puts " If you're using .exe version of this shell please report to ".bold.cyan
puts " Email: cyniclimbu@gmail.com\n".bold.cyan
system("pause")
exit
end #END F09


else #ELSE F08
print " I have a"; print " good ".bold.green; print "news and a "; print "bad ".bold.red; puts "news."
print " Good news ".bold.green; puts ": rootShell was found.".bold.yellow
print " Bad news  ".bold.red; puts ": I cannot make changes on setting file".bold.yellow
puts  "             as this shell isn't running as administrator.\n".bold.yellow
puts "\n What can I do about it?".bold.green
puts " All you can do is restart the shell as administrator.\n".bold.cyan
puts " MORE TO IT.".bold.green
puts " The shell checks if it's running as administrator when it starts.".bold.cyan
puts " You are seeing this message because you played with the source code.".bold.cyan
puts " Or if you didn't do anything but saw this please report to".bold.cyan
puts " Email: cyniclimbu@gmail".bold.cyan
system("pause"); exit
end #END F08

system("pause"); exit

elsif not Dir.exists?(RootShell) # ELSIF G03
print " rootShell "; print "does not ".bold.red; print "exist here in "; puts "#{path}".bold.yellow


else # ELSE G03
puts ERRORMSG
end # END G03

elsif path.empty? or path == " " or path == "   " # ELSIF G02
puts " What am I supposed to do with  an empty input?".bold.red #(ﾉಥ益ಥ）ﾉ﻿ ┻━┻ (ノಠ益ಠ)ノ彡┻━┻

elsif not Dir.exists?(path) # ELSIF G02
print  " #{path}".bold.yellow; puts " does not exist.".bold.red

else # ELSE G02
puts ERRORMSG

end # END G02
loop += 1
end # END G01
puts OUTTAATTEMPTS

end #END OF SUB-METHOD SBM02



=begin
ABOVE SEARCH_SPECIFIC
=end

puts " 1. Search multiple directories.".bold.green
puts "    Look through 5 directories at a time.".bold.yellow
puts " 2. Search in a given directory.".bold.green
puts "    Look in a directory.".bold.yellow

dont = 0
loop = 0; while loop < 6 #WHILE LOOP F02
#----------------------------------------
print " > "
choice_locate = get_character.chr

if choice_locate == "1" #IF F03
print "1\n".bold.white

search_multiple

system("pause"); exit

elsif choice_locate == "2" #ELSIF F03
print "2\n".bold.white
search_specific

system("pause"); exit

#----------------------------------------
elsif choice_locate == "3" or choice_locate == "\e"
print "Hey,".bold.green; print " what".bold.red; print " are you doing".bold.green; puts "?".bold.red


elsif choice_locate != "1" or choice_locate != "2" #ELSIF F03
puts "Given character is out of option.".bold.red


else #ELSE F03
puts ERRORMSG.bold.cyan
sleep 5; exit
end #END F03


loop += 1
end #END F02
#----------------------------------------
end #END F01



=begin

########################################## B O R D E R ##########################################

=end

#--------------------METHOD--------------------# 006
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
elsif b01_loop != "1" or b01_loop != "2" #ELSIF B03
puts "Given character is out of option.".bold.red

elsif loop == 6 #ELSIF B03
puts OUTTAATTEMPTS
sleep 5; exit

else # ELSE B03
puts ERRORMSG
end  # ELSE B03
#------------------------------------------------
loop += 1
end #END B02
#------------------------------------------------
end #END B01
#--------------------METHOD--------------------# 006

=begin

########################################## B O R D E R ##########################################

=end




def installer  #INSTALLER A01
puts " I N S T A L L E R\n".bold.green
puts " PRESS NUMBER".bold.green
puts " 1 - Begin install".bold.green
puts "     Requires administrator privilege.".bold.cyan
puts " 2 - Locate rootShell".bold.green
puts "     Only if you installed previously.".bold.yellow
puts "     Requires administrator privilege".bold.cyan
puts " 3 - Abort Installation.".bold.green

loop = 0; while loop < 7 #A02 until loop
print " > "
a02_loop = get_character.chr #DETECT KEY FROM KEYBOARD
							 # .chr WILL TURN RAW VALUE INTO KEYS
#------------------------------------------------
if a02_loop == "1" # IF A03
print "1\n"
install

#------------------------------------------------
elsif a02_loop == "2" #ELSIF A03
print "2\n".bold.white
locate_rootshell

#------------------------------------------------
elsif a02_loop == "3"       # ELSIF A03
undef installer		        # UNDEFINE METHOD installer
							# WE WON'T NEED THIS METHOD ANYWAY
msg = ["  A","b","o","r","t"," ","s","u","c","c","e","s","s","!"]
#lol I know :P
msg.each do |animate_msg|
print animate_msg.bold.cyan
sleep 0.05
end
sleep 4; exit
#------------------------------------------------
#This guy is suspicious d(o_o)b
elsif loop == 6 #PART OF BOTH A03 & A02
puts OUTTAATTEMPTS
sleep 4; exit 
#------------------------------------------------
else # ELSE A03
puts "Given character is out of option.".bold.red
end  # END A03
#------------------------------------------------
loop += 1
end #A02 end of loop
#------------------------------------------------
end  #INSTALLER END A01


admin?
sleep
