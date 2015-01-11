#This is the only interactive script of rootShell.

require 'colored'

loadFiles = ["rootShellGemFile.rb", "main_methods.rb"] # commands.rb and commands_database should also be loaded later on.
$prev_dir = Dir.pwd # WE NEED TO GET BACK HERE AFTER WE FINISH LOADING REQUIRED FILES

loadFiles.each do |load| # LOAD REQUIRED FILES

  next if not load.include?(".rb") # IGNORE FILES FROM loadFiles THAT ARE NOT FROM IN ".rb" FORMAT
  
  unless File.exists?(load)
  
   print "#{load}".bold.cyan; puts " not found.".bold.red
   print "Current directory:".bold.white; puts " #{Dir.pwd}".bold.green
   puts  "Aborting rootShell.".bold.red; system("pause"); exit
   
  end # END OF LOADING FILES
  
 print "Loading ".bold.green; puts "#{load}".bold.cyan
 require "./#{load}"  # Is this a bad idea?
 puts "Done!".bold.white
 
end 

puts "Searching rootShell's system directory.".bold.cyan

check_files # CALL METHOD check_files FROM main_methods.rb

if  $SYSSTATUS == true # TRUE MEANS SYSTEM DIRECTORY rootShell EXISTS

puts "Finished loading all files!" # ROOTSHELL HAS FINISHED LOADING ALL IMPORTANT FILES AND IS GOOD TO GO!
	# LOAD CMD-LIKE SHELL # CALL METHOD FROM commands.rb WHICH DOES NOT EXIST YET. It's in the works currently.
	
elsif $SYSSTATUS == false

	what2do	# CALL METHOD what2do FROM main_methods.rb
	
end

puts "\nEnd of the program! :)\n"
sleep




