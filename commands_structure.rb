#======================== DIRECTORY RELATED COMMANDS ========================#
def cd

current_directory = "Relative path - #{Dir.pwd.gsub('/','\\')} Absolute path - #{File.basename Dir.pwd}\n".bold.green

	if current_directory.length > 84 #IF CD02
	 print "Relative path".bold.cyan << " - "; puts "#{Dir.pwd}".bold.green
 	 print "Absolute path".bold.cyan << " - "; puts "#{File.basename Dir.pwd}\n".bold.green
	 
	else # ELSE CD02 
	 puts current_directory
	end  # IF CD02

end

def cd_to_dir

path_dir = $SYSDIRECTORY + '\setting\path' # ..rootshell\setting\path

	if Dir.exists?(path_dir)
	 short_dir = true
	else # CAN BE USED check_custom_dir from main_methods.rb instead of this if/else statement
	 short_dir = false
	end

	if Dir.exists?($cd_to_dir)
	 Dir.chdir($cd_to_dir)
	elsif Dir.exists?($cd2dir)
	 Dir.chdir($cd2dir)
	elsif short_dir == true 
	 Dir.chdir(path_dir)
	 
	 if File.exists?($cd2dir) and File.zero?($cd2dir) == false and File.size?($cd2dir) <= 3000 # 3 KB
	  short_path = File.read($cd2dir).delete("\n")
		if Dir.exists?(short_path)
		 Dir.chdir(short_path)
		end
	 else 
	 puts "The system cannot find the path specified.\n".bold.red
	 Dir.chdir($prev_dir)
	 end
	
	else 
	 puts "The system cannot find the path specified.\n".bold.red
	 Dir.chdir($prev_dir)
	end

end

#======================== DIRECTORY RELATED COMMANDS ========================#

#======================== FILE RELATED COMMANDS ========================#
def newFile

	if $file =~ /^(\s+.*|.*[\/:"?*|<>].*|.*\s+||.*\.)$/ or $file.include?('\\')
	  puts "Invalid file name.\n".bold.blue
	  
	elsif File.exists?($file)
	
	 puts "#{$file} exists, do you want to replace it?(Y/N)"
	  loop do
	  
	   print "> "; choice = get_character.chr; puts "\n"
	   
	     if choice =~ /y/i; print "Yes\n"
		  
		  puts "Write to #{$file} Type EnD to finish writing.".bold.green
		  file = File.open($file,"w")
		   loop do
		    print "> "
		    content = gets.chomp
		     break if content == "EnD"
	 	     file.puts(content)
		    end
		   file.close
		   puts "Finished writing.\n".bold.green
		  
		 elsif choice =~ /n/i; print "No\n"
	       break; puts "New file was not created.\n".bold.cyan
		  end
	  end
	  
	else 

	 puts "Write to #{$file} Type EnD to finish writing.".bold.green
	 file = File.open($file,"w")
	  loop do
	  print "> "
	  content = gets.chomp
	   break if content == "EnD"
	   file.puts(content)
	  end
	  file.close
	 puts "Finished writing.\n".bold.green
	
	end
end

#======================== FILE RELATED COMMANDS ========================#
