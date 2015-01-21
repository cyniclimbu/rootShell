def cd

current_directory = "Relative path -  #{Dir.pwd.gsub('/','\\')}   Absolute path - #{File.basename Dir.pwd}\n"

	if current_directory.length > 74 #IF CD02
	 puts "Relative path  - #{Dir.pwd}".bold.green
 	 puts "Absolute path - #{File.basename Dir.pwd}".bold.green
	 
	else # ELSE CD02 
	 puts current_directory.bold.green
	end  # IF CD02

end
#=======================================================================#
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
	 puts "The system cannot find the path specified."
	 Dir.chdir($prev_dir)
	 end
	
	else 
	 puts "The system cannot find the path specified."
	 Dir.chdir($prev_dir)
	end

end
#=======================================================================#
