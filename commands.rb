print "#{ROOTSHELL}".bold.green; print " by ".bold.white; puts "#{DEV}\n".bold.cyan


# Command shell begins from below here.

loop do # INFINITE LOOP FOR commands

print "#{Dir.pwd.capitalize.gsub('/','\\')}>"; command = gets.chomp

#---------------------------------------------------------------
	if command.strip == "cd" || command.strip == "CD"
	cd
	
	elsif command.include?("cd")
	 $prev_dir = Dir.pwd
	 $cd2dir = command.split(' ')[1] # FOR SHORT PATH FEATURE
	 $cd_to_dir = /([A-Z|a-z]:\\[^*|"<>?\n]*)|(\\\\.*?\\.*)/.match(command).to_s # FOR USUAL DIR NAVIGATION
	 cd_to_dir
#---------------------------------------------------------------
	elsif command.strip == "newfile"
	 puts "File name is not defined.\n".bold.red
	 
	elsif command.include?("newfile")
	 filename = command.scan(/\S+ ?/) # "a b c"  =>  ["a ","b ","c "]
	 filename.delete_at(0); $file = filename.join
	 
	 newFile
	 
#---------------------------------------------------------------	 
	else
	 print "Unknown command - ".bold.cyan; puts "#{command}\n".bold.red
	end


end # END OF INFINITE LOOP FOR commands
