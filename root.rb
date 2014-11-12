puts "                       L O A D I N G   S H E L L\n"
require 'colored'
#Compiler version - ruby 2.0.0p576 (2014-09-19) [i386-mingw32]
#WRITTEN ON NOTEPAD++
#Dev - SeeWhyAnEyeSee
=begin
This ruby file has the installer method that will help install files for the shell.
This is not the main shell. 
The *00*, *-00-* & *01*'s you see are the tag number that can help identify stuff when debugging.
Some gems might not be supported by your compiler version or not installed.

Check if this is first time installing and if it is then only run first_time else don't use 
=end

#Declaring some variables that's needed in multiple files/methods.
MAIN_DIR = "root"
$current_attempt = 0
$clear_screen = system('cls')

def first_time? #FIRST TIME INSTALLING METHOD *-00-*
check_admin = 'reg query "HKU\S-1-5-19"'
is_admin = system(check_admin)

puts "Initializing."




end             #END *-00-*

#-------------------------------------
first_time?
sleep