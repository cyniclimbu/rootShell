require 'win32ole'
myfilename = "a.rb"
def first_time? #FIRST TIME INSTALLING METHOD *-00-*
check_admin = 'reg query "HKU\S-1-5-19"'
admin_is = system(check_admin)
system('cls')
puts "Initializing."

if admin_is == true
puts "Admin is true"
elsif admin_is == false
puts "Launch the program as admin please."

shell = WIN32OLE.new('Shell.Application')
shell.ShellExecute(myfilename, nil, nil, 'runas')

else
puts "dafuq?"

end



end             #END *-00-*