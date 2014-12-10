puts "                        L O A D I N G\n"
require 'colored'
require 'highline'
require 'win32ole'
require 'benchmark'
=begin
A01, A02, B02 Are identification codes to easily identify
start and end of evals, loops, methods etc.
A01's sub id code can be A02, doesn't matter.
=end
include HighLine::SystemExtensions

#Compiler version - ruby 2.0.0p576 (2014-09-19) [i386-mingw32]
#WRITTEN ON NOTEPAD++
#Dev - SeeWhyAnEyeSee

RootShell = "rootShell"
ERRORMSG = " An unknown error occured.\n Please send an email to cyniclimbu@gmail.com\n Describing what caused it.".bold.cyan
OUTTAATTEMPTS = "OUT OF ATTEMPTS\n   Restart the shell to try again.".bold.white
TIMER = [0.00001,0.00001,0.01,0.001,0,0.0001,0.1,0.1,0.0001,0.0001,0.01,0.0000001]
PERCENTAGE = (1..100)

sleep