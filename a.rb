require 'colored'
require 'highline'
require 'win32ole'

include HighLine::SystemExtensions

exit if defined?(Ocra) #NO NEED TO COPY THIS TOO

=begin
methods of option 1 and option 2 should sleep from within the method because this method does not provide sleep 
for them
=end



rootShell = "rootShell"
ERRORMSG = " An unknown error occured.\n Please send an email to cyniclimbu@gmail.com\n Describing what caused it.".bold.cyan
OUTTAATTEMPTS = "OUT OF ATTEMPTS\n   Restart the shell to try again.".bold.white
$timer = 0.1 #Just for fun, sleep timer for animation on little messages.

def installer  #INSTALLER A01
puts " I N S T A L L E R\n".bold.green
puts " PRESS NUMBER".bold.green
puts " 1 - Begin install".bold.green
puts " 2 - Locate rootShell".bold.green
puts "     Only if you installed previously.".bold.yellow
puts " 3 - Abort Installation.".bold.green

loop = 0; while loop < 7 #A02 until loop
print " > "
a02_loop = get_character.chr #DETECT KEY FROM KEYBOARD
							 # .chr WILL TURN RAW VALUE INTO KEYS
#------------------------------------------------
if a02_loop == "1" # IF A03
puts "Do method install" #def install ... end

#------------------------------------------------
elsif a02_loop == "2" #ELSIF A03
puts "Do method locate" #def locate ... end






#------------------------------------------------
elsif a02_loop == "3"       # ELSIF A03
undef installer		        # UNDEFINE METHOD installer

msg = ["  A","b","o","r","t"," ","s","u","c","c","e","s","s","!"]
#lol I know :P
msg.each do |animate_msg|
print animate_msg.bold.cyan
sleep $timer
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


installer
sleep