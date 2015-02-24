puts "#{ROOTSHELL}".bold.green << " by ".bold.white << "#{DEV}\n".bold.cyan << "Version - ".bold.white << "#{VERSION}\n".bold.magenta


# Command shell begins from below here.

loop do # INFINITE LOOP FOR commands

print "#{Dir.pwd.capitalize.gsub('/','\\')}>"; command = gets.chomp.downcase # CASE INSENSITIVE!

##---------------------------------------------------------------##
	if command.length > 75
	 puts "Input is too long.\n".bold.red
	 
	elsif command.strip == "cd" || command.strip == "CD"
	cd

	elsif command =~ /cd/i
	 $prev_dir = Dir.pwd
	 $cd2dir = command.scan(/\S+ ?/); $cd2dir.delete_at(0) # FOR both SHORT PATH FEATUREs & ABSOLUTE PATH FEATUREss
	 $cd_to_dir = /([A-Z|a-z]:\\[^*|"<>?\n]*)|(\\\\.*?\\.*)/.match(command).to_s # FOR USUAL DIR NAVIGATION
	 cd_to_dir
	 
#---------------------------------------------------------------#	 
	elsif command.strip == "dir" || command.strip == "DIR"
	 dir
	
	elsif command.strip == "dir ext" || command.strip == "DIR EXT"
	 puts "Extension is " << "not defined.\n".bold.red
	 
	elsif command =~ /dir ext/i
	 dir_extension(command)
	
	elsif command.strip == "dir files" || command.strip == "DIR FILES"
	 dir_file
	 
	elsif command.strip == "dir folders" || command.strip == "DIR FOLDERS"
	 dir_folder
	 
##---------------------------------------------------------------##
	elsif command.strip == "newfile" || command.strip == "NEWFILE"
	 puts "File name is " << "not defined.\n".bold.red
	 
	elsif command =~ /newfile/i
	
	 filename = command.scan(/\S+ ?/) # "a b c"  =>  ["a ","b ","c "]
	 filename.delete_at(0); file = filename.join
	 newFile(file)
 
	elsif command.strip == "openfile" || command.strip == "OPENFILE"
	 puts "File name is " << "not defined.\n".bold.red
	
	elsif command =~ /openfile/i
	
	 filename = command.scan(/\S+ ?/) # "a b c"  =>  ["a ","b ","c "]
	 filename.delete_at(0); file = filename.join
	 openFile(file)
	 
##---------------------------------------------------------------##
	elsif command.strip == "hide" || command.strip == "HIDE"
	 puts "Content is not defined.\n".bold.red
	 
	elsif command =~ /hide/i
	 # command = command.strip; 
	 
	 
	 if command.split(' ')[1] == "all"
	  contents = "all"
	  command = command.scan(/\S+ ?/)
	  hideContents(command, contents)
	 
	 else
	  contents = "single"
	  command = command.scan(/\S+ ?/)
	  command.delete_at(0); command = command.join
	  hideContents(command, contents)
	 end
	 
##---------------------------------------------------------------##	 
	elsif command.strip == "show" || command.strip == "SHOW"
	 puts "Content is not defined.\n".bold.red
	 
	elsif command =~ /show/i
	 
	 
	 if command.split(' ')[1] == "all"
	  contents = "all"
	  command = command.scan(/\S+ ?/)
	  showContents(command, contents)
	 
	 else
	  contents = "single"
	  command = command.scan(/\S+ ?/)
	  command.delete_at(0); command = command.join
	  
	  showContents(command, contents)
	 end
	 
##---------------------------------------------------------------##
	elsif command.strip == "ping"
	 puts "Host is not defined.\n".bold.red
	 
	elsif command =~ /ping/i
	 command = command.scan(/\S+ ?/) 
	 command.delete_at(0); host = command.join
	 ping(host)
	 
##---------------------------------------------------------------##
	elsif command.strip == "ipconfig"
	 system("ipconfig"); puts "\n"
	 
	elsif command =~ /ipconfig/i
	 system(command); puts "\n"
##---------------------------------------------------------------##
	elsif command.strip == "text to md5"
	 text2md5
##---------------------------------------------------------------##
	elsif command.strip == "seewhyeyesee" || command.strip == "hi"
	 message
##---------------------------------------------------------------##	
	elsif command.strip == "setting" || command.strip == "SETTING"
	 SETTING() # Small brackets because SETTING will be confused for a CONSTANT
	 
##---------------------------------------------------------------##
	elsif command.strip == "start" || command.strip == "START"
	 puts "Start what?\n".bold.white
	 
	elsif command.include?("start")
	 command = command.scan(/\S+ ?/)
	 command.delete_at(0); target = command.join
	 explorer(target)
	 
##---------------------------------------------------------------##	
	elsif command.strip == "del" || command.strip == "DEL" || command.strip == "delete" || command.strip == "DELETE"
	 puts "Delete what?\n".bold.green
		
##---------------------------------------------------------------##	
	elsif command =~ /del/i || command =~ /delete/i
	 command = command.scan(/\S+ ?/)
	 command.delete_at(0); content = command.join
	 delete(content)
##---------------------------------------------------------------##		
	elsif command.strip == "cls" || command.strip == "CLS" || command.strip == "clear" || command.strip == "CLEAR"
	 system("cls")
	
	elsif command.strip == "exit" || command.strip == "EXIT"
	 exit
	 
	elsif command.empty?
	
	else
	 print "Unknown command - ".bold.cyan; puts "#{command}\n".bold.red
	end


end # END OF INFINITE LOOP FOR commands
