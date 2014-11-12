puts "                        L O A D I N G\n"
require 'colored'
#Compiler version - ruby 2.0.0p576 (2014-09-19) [i386-mingw32]
#WRITTEN ON NOTEPAD++
#Dev - SeeWhyAnEyeSee
=begin
This ruby file has the installer method that will help install files for the shell.
This is not the main shell. 
The *00* & *01*'s you see are the tag number that can help identify stuff when debugging.
Some gems might not be supported by your compiler version or not installed.
=end

#Declaring some variables that's needed in multiple files/methods.
MAIN_DIR = "root"
$current_attempt = 0


def installer #INITIALIZE INSTALLER *00*


if $current_attempt == 6 #IF *01*

puts "Maximum attempts reached!".bold.red
puts "Exiting in 6 seconds.".bold.green
puts "Start the shell again to try again.".bold.red
sleep 6; exit

else #ELSE *01*
$current_attempt += 1


if Dir.exists?(MAIN_DIR) #IF *02*

Dir.chdir MAIN_DIR #CHECK IF MAIN_DIR EXISTS

else #ELSE *02*




end #END *02*



end  #END *01*



end #END OF INSTALLER *00*
#-------------------------------------
installer
sleep