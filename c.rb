require 'highline'

def check_install #INITIALIZE CHECK_INSTALL *00*
check_drive = Dir.pwd #This checks if the current drive is C: or not.

if check_drive =~ /d:/i #IF *01*
#Check if dir c:\windows exists, dnt just chdir to it beforehand.

if Dir.exists?('cynic') #IF *02*


else #ELSE *02*


end #END *02*


else #ELSE *01*
puts  " Wait, this isn't C: ?\n\n"
puts  " The shell couldn't figure out which drive this is."
puts  " Which drive is it? e.g C:, D:, Z:"
print " Drive: "
$drive = gets.chomp
puts "So, it's " + $drive + " right?(Y/N)"

#Will use highline gem to detect key press
#Without hitting enter

end  #END *01*



end #END OF CHECK_INSTALL *00* 

check_install
sleep