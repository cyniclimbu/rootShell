#======================== DIRECTORY RELATED COMMANDS ========================#
def cd

current_directory = "Relative path - #{Dir.pwd.gsub('/','\\')} | Absolute path - #{File.basename Dir.pwd}\n".bold.green

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

def dir
	contents = Dir.glob'*'
	puts "Directory of #{Dir.pwd}"
	 
	contents.each do |list|
	 
	 if Dir.exists?(list) 
	  print "#{list}".bold.white << " - " << "Directory.\n".bold.green
	   
	 elsif File.exists?(list)
	  print "#{list}".bold.cyan << " - " << "File.\n".bold.green
	  
	 else
	  print "#{list}".bold.cyan << " - " << "Unknown.\n".bold.green
	 end
	end
end

def dir_extension

 command = $command 
 command = command.scan(/\S+ ?/)
 
   if command.size >= 4
    puts "Bad extension.".bold.red

   else
    extension = command.delete_at(2)
	
     if not extension.include?(".")
      extension = "." << extension
	  extension = Dir.glob"*#{extension}"
	  
      extension.each do |list|
	   puts list.bold.cyan
	  end
	  
	 else 
	  extension = Dir.glob"*#{extension}"
	  
      extension.each do |list|
	   puts list.bold.cyan
	  end
	  
     end
   
   end
puts "\n" 
 
end

def dir_folder

contents = Dir.glob"*"

 contents.each do |list|
  
  next if File.file?(list)
  puts list.bold.cyan
  
 end
puts "\n"
end

def dir_file

contents = Dir.glob"*"

 contents.each do |list|
  
  next if File.directory?(list)
  puts list.bold.cyan
  
 end
puts "\n"
end

#======================== DIRECTORY RELATED COMMANDS ========================#

#======================== FILE RELATED COMMANDS ========================#
def newFile

	if $file =~ /^(\s+.*|.*[\/:"?*|<>].*|.*\s+||.*\.)$/ or $file.include?('\\')
	  puts "Invalid file name.\n".bold.blue
	  
	elsif File.exists?($file)
	
	 puts "#{$file} exists, do you want to replace it?(Y/N)"
	  loop do
	  
	   print "> "; choice = get_character.chr
	   
	     if choice =~ /y/i; puts "Yes\n"
		  
		  puts "Write to #{$file} Type EnD to finish writing.".bold.green
		  file = File.open($file,"w")
		  
		   loop do
		    print "> "
		    content = gets.chomp
		     break if content == "EnD"
	 	     file.puts(content)
		    end
			
		   file.close
		   puts "Finished writing.\n".bold.green; break
		   
		 elsif choice =~ /n/i; puts "No\n"
	       puts "File was not over-written.\n".bold.cyan; break
		   
		 else puts "\n"  
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

def openFile

	if $file =~ /^(\s+.*|.*[\/:"?*|<>].*|.*\s+||.*\.)$/ or $file.include?('\\')
	  puts "Invalid file name.\n".bold.blue
	
	elsif not File.exist?($file)
	 puts "#{$file} does not exist. Create as new file?(Y/N)"
	 
		loop do
	  
	     print "> "; choice = get_character.chr
	   
	      if choice =~ /y/i; puts "Yes\n"
		   puts "Write to #{$file} Type EnD to finish writing.".bold.green
		   file = File.new($file,"a")
		   
		    loop do
		     print "> "
		     content = gets.chomp
		      break if content == "EnD"
	 	      file.puts(content)
		    end
			
		   file.close
		   puts "Finished writing.\n".bold.green; break
		   
		 elsif choice =~ /n/i; puts "No\n"
	       puts "New file was not created.\n".bold.cyan; break
		   
		 else puts "\n"  
		  end
	  end
	  
	else  
	
	puts "Write to #{$file} Type EnD to finish writing.".bold.green
	file = File.open($file,"a")
	
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

#======================== OTHER COMMANDS ========================#
def delete
x = $command 

puts "Are you sure?(Y/N)".bold.green

loop do

print "> "; choice = get_character.chr

  if choice =~ /y/i
 
   if File.file?(x)
    File.delete(x)
	
	 if File.exists?(x)
	  print "Error".bold.red << " #{x} couldn't be deleted.\n\n"

	 else
	  print "#{x}".bold.cyan << " was deleted.\n\n"
	 end; break
	
   elsif File.directory?(x)
	system("rmdir #{x} /Q /S") # Umm... (._.) (`_`) ('_') (._.)
	
	 if Dir.exists?(x)
	  print "Error".bold.red << " #{x} couldn't be deleted.\n\n"

	 else
	  print "#{x}".bold.cyan << " was deleted\n\n"
	 end; break
	
   else
    puts "#{x}".bold.cyan << " is nowhere to be found.\n\n"; break
   end
 
  elsif choice =~ /n/i
   puts "#{x}".bold.cyan << " was not deleted.\n\n"; break
  
  else
   puts "\n"
  end
end
end