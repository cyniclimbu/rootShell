require 'highline'
require 'colored'
include HighLine::SystemExtensions
ERRORMSG = " An unknown error occured.\nPlease send an email to cyniclimbu@gmail.com\nDescribing what caused it."


def confirm_drive_is_correct

attempts = 0
while attempts <= 4
#----------------------------
puts " Just press Y or N!\n"
print " > "
confirm_key = get_character  #GET RAW VALUE
decode_key = confirm_key.chr #CHANGE RAW VALUE TO CHARACTER
puts "\n"
#----------------------------


if decode_key =~ /y/i
join_dir = $drive + "\windows"
break #ESCAPE FREE FROM THE LOOP 


elsif decode_key =~ /n/i
puts  " Which drive is it? e.g F:, B:, E:"
print " Drive: "
$drive = gets.chomp         
ask_drive_name
confirm_drive_is_correct
break
end
attempts += 1
end
end


def ask_drive_name #INITIALIZE ASK_DRIVE_NAME

if $drive.length >= 3 #IF *01*
puts " Your drive letter is incorrect."
puts " A drive letter should only contain two characters."
puts " - A colon punctuation. i.e ':'"
puts " - A letter, e.g: A,Y,E,C"

attempts = 0
until attempts == 6 #UNTIL *02*
puts  " Which drive is it? e.g A:, X:, E:"

print " Drive: "
$drive = gets.chomp 
 
if $drive.length <= 2 and $drive =~ /:/#IF *02-0*
break

elsif attempts == 5 #ELSIF *02-0*
puts " Restart the shell to try again.".bold.red
sleep

end #END *02-0*
attempts += 1
end #END OF UNTIL *02*
end #END *01*

end #END OF ASK_DRIVE_NAME



def check_install #INITIALIZE CHECK_INSTALL
check_drive = Dir.pwd #This checks if the current drive is C: or not.

if check_drive =~ /c:/i #IF *03*




else #ELSE *03*
puts  " Wait, this isn't C: ?\n\n"; puts  " The shell couldn't figure out which drive this is."
puts  " Which drive is it? e.g C:, D:, Z:"
print " Drive: "
$drive = gets.chomp         #HANDLE THIS VAR WITH CARE
#---------------------------------------------
ask_drive_name
#---------------------------------------------
puts " CONFIRM INPUT?"
puts " It is " + "#{$drive} ? ".bold.white + "(Y/N)"
#---------------------------------------------

confirm_drive_is_correct

#---------------------------------------------

end  #END *03*

puts "Loop is broken!"
=begin
Since the loop can only be broken if you type the correct drive letter
Now we look again at line 21.
Our objective now is to correct all the tags *00*, *01*, *01-0* and stuff and then we
Dir.chdir join_dir
File.exists?("first_install") #This checks if the shell was installed before or not.
if it does we will tell user to provide us with dir where the rootShell dir is 
else we will proceed with installation of rootShell and so on.
Also add the code from a.rb to this shell so it can create new folder on join_dir 
a.k.a [insert driver name letter here] + '\windows' and make a file 
=end

end #END OF CHECK_INSTALL

check_install
sleep