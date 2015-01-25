print "#{ROOTSHELL}".bold.green; print " by ".bold.white; puts "#{DEV}\n".bold.cyan


# Command shell begins from below here.

loop do # INFINITE LOOP FOR commands

print "#{Dir.pwd.capitalize.gsub('/','\\')}>"; command = gets.chomp.downcase

##---------------------------------------------------------------##
	if command.strip == "cd" || command.strip == "CD"
	cd
#---------------------------------------------------------------#	
	elsif command =~ /cd/i
	 $prev_dir = Dir.pwd
	 $cd2dir = command.split(' ')[1] # FOR SHORT PATH FEATURE
	 $cd_to_dir = /([A-Z|a-z]:\\[^*|"<>?\n]*)|(\\\\.*?\\.*)/.match(command).to_s # FOR USUAL DIR NAVIGATION
	 cd_to_dir
#---------------------------------------------------------------#	 
	elsif command.strip == "dir" || command.strip == "DIR"
	 dir
#---------------------------------------------------------------#	
	elsif command.strip == "dir ext" || command.strip == "DIR EXT"
	 puts "Extension is " << " not defined.\n".bold.red
	 
	elsif command =~ /dir ext/i
	 $command = command
	 dir_extension
	
	elsif command.strip == "dir file" || command.strip == "DIR FILE"
	 dir_file
	 
	elsif command.strip == "dir folder" || command.strip == "DIR FOLDER"
	 dir_folder
	 
##---------------------------------------------------------------##

	elsif command.strip == "newfile" || command.strip == "NEWFILE"
	 puts "File name is " << "not defined.\n".bold.red
	 
	elsif command =~ /newfile/i
	
	 filename = command.scan(/\S+ ?/) # "a b c"  =>  ["a ","b ","c "]
	 filename.delete_at(0); $file = filename.join
	 newFile
#---------------------------------------------------------------#	 
	elsif command.strip == "openfile" || command.strip == "OPENFILE"
	 puts "File name is " << "not defined.\n".bold.red
	
	elsif command =~ /openfile/i
	
	 filename = command.scan(/\S+ ?/) # "a b c"  =>  ["a ","b ","c "]
	 filename.delete_at(0); $file = filename.join
	 openFile
	 
##---------------------------------------------------------------##
	
	elsif command.strip == "del" || command.strip == "DEL" || command.strip == "delete" || command.strip == "DELETE"
	 puts "Delete what?\n".bold.green
	
	elsif command =~ /del/i || command =~ /delete/i
	 command = command.scan(/\S+ ?/)
	 command.delete_at(0); $command = command.join
	 delete
	
	elsif command.strip == "cls" || command.strip == "CLS" || command.strip == "clear" || command.strip == "CLEAR"
	 system("cls")
	 
	else
	 print "Unknown command - ".bold.cyan; puts "#{command}\n".bold.red
	end


end # END OF INFINITE LOOP FOR commands
