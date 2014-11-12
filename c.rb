def check_install #INITIALIZE CHECK_INSTALL *00*
check_drive = Dir.pwd #This checks if the current drive is C: or not.

if check_drive =~ /d:/i #IF *01*
Dir.chdir 'c:\windows'



else #ELSE *01*
puts  " Wait, this isn't C: ?\n\n"
puts  " The shell couldn't figure out which drive this is."
puts  " Which drive is it? e.g C:, D:, Z:"
print " Drive: "
$drive = gets.chomp
puts $drive


end  #END *01*



end #END OF CHECK_INSTALL *00* 

check_install
sleep