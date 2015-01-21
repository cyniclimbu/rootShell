print "#{ROOTSHELL}".bold.green; print " by ".bold.white; puts "#{DEV}\n".bold.cyan


# Command shell begins from below here.

loop do # INFINITE LOOP FOR commands

print "#{Dir.pwd.capitalize.gsub('/','\\')}>"; command = gets.chomp.downcase


	if command.strip == "cd"
	cd
	
	elsif command.include?("cd")
	 $prev_dir = Dir.pwd
	 $cd2dir = command.split(' ')[1] # FOR SHORT PATH FEATURE
	 $cd_to_dir = /([A-Z|a-z]:\\[^*|"<>?\n]*)|(\\\\.*?\\.*)/.match(command).to_s # FOR USUAL DIR NAVIGATION
	 cd_to_dir
	
	else
	
	end


end # END OF INFINITE LOOP FOR commands
