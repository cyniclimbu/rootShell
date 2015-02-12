`title rootShell`
require 'colored'

$prev_dir = Dir.pwd
=begin

Dir.chdir('c:\somedir\whereUwantTo\putUninteractive\scripts)
You can move scripts loadFiles loads to somewhere else and then dir back to where rootShell exists
just use Dir.chdir $prev_dir in line 32 where loadFiles ends

=end

loadFiles = ["rootShellGemFile.rb", "main_methods.rb", "commands_structure.rb"] # Should ONLY load un-interactive scripts.

loadFiles.each do |load| # LOAD REQUIRED FILES

  next if not load.include?(".rb") # IGNORE FILES FROM loadFiles THAT ARE NOT FROM IN ".rb" FORMAT
  
  unless File.exists?(load)
  
   print "#{load}".bold.cyan; puts " not found.".bold.red
   print "Current directory:".bold.white; puts " #{Dir.pwd}".bold.green
   puts  "Aborting rootShell.".bold.red; system("pause"); exit
   
  end # END OF LOADING FILES
  
 puts "Loading ".bold.green << "#{load}".bold.cyan
 require "./#{load}"  # How bad is this?
 puts "Done!".bold.white
 
end 

puts "Searching rootShell's system directory.".bold.cyan

check_files # CALL METHOD check_files FROM main_methods.rb

if  $SYSSTATUS == true # TRUE MEANS SYSTEM DIRECTORY rootShell EXISTS

puts "Finished loading all files!" # ROOTSHELL HAS FINISHED LOADING ALL IMPORTANT FILES AND IS GOOD TO GO!
	# LOAD CMD-LIKE SHELL # CALL METHOD FROM commands.rb WHICH DOES NOT EXIST YET. It's in the works currently.
	
	system("cls")
	require './commands.rb'
	
elsif $SYSSTATUS == false

	what2do	# CALL METHOD what2do FROM main_methods.rb
	
end

puts "\nEnd of the program! :)\n"
sleep




