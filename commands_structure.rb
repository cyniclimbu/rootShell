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
	 # short_dir = false
	 # Dir.mkdir(path_dir)  # This will only work if the last dir is missing
	 short_dir = false   # In this case it's '\path' Is '\setting' is missing this won't work at all
	end

	if Dir.exists?($cd_to_dir)
	 Dir.chdir($cd_to_dir)
	elsif Dir.exists?($cd2dir)
	 Dir.chdir($cd2dir)
	elsif short_dir # true
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
	 
	 if File.directory?(list) 
	  print "#{list}".bold.white << " - " << "Directory.\n".bold.green
	   
	 elsif File.file?(list)
	  print "#{list}".bold.cyan << " - " << "File.\n".bold.green
	  
	 else
	  print "#{list}".bold.cyan << " - " << "Unknown.\n".bold.red
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


#======================== NETWORK COMMANDS ========================#


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

def explorer
target = $command 

 if Dir.exists?(target) || File.exists?(target)
  puts "Waiting.".bold.white
  system("explorer #{target}")
 
 else
  print "#{target}".bold.cyan << " does not exist or cannot be opened.\n\n".bold.green
 end


end

#======================== SETTING COMMANDS ========================#
def SETTING


def PathVariable

prev_dir = Dir.pwd
path_dir = $SYSDIRECTORY + '/setting/path'; path_dir = path_dir.gsub('\\','/')

	if not Dir.exists?(path_dir)
	# short_dir = true
	# else   #  CAN BE USED check_custom_dir from main_methods.rb instead of this if/else statement
	 # short_dir = false     #  This will only work if the last dir is missing
	 # Dir.mkdir(path_dir)   #  In this case it's '\path' Is '\setting' is missing this won't work at all 
	 puts "#{path_dir}  is missing."; system("pause"); exit
	end

def NewPathVariable(prev_dir)

puts "New Path Variable\n".bold.cyan
puts "INFO.".bold.green
puts "- Absolute path will be chosen over path variable if available.".bold.yellow
puts "- Path variables cannot contain ->".bold.yellow << " /,\\,?\>,<,\" \"".bold.magenta
	name = ""
	loop do
	 print "Name: "; name = gets.chomp
	 
	 if name =~ /^(\s+.*|.*[\/:"?*|<>].*|.*\s+||.*\.)$/ || name.include?('\\') || name.include?(" ") || name.empty?
	  puts "Invalid name.".bold.blue
	  
	 elsif File.exists?(name)
	  puts "Value is reserved.".bold.red
	 
	 else
	 break
	 end 
	end
	
	 loop do 
	  print "Value: "; value = gets.chomp; value = /([A-Z|a-z]:\\[^*|"<>?\n]*)|(\\\\.*?\\.*)/.match(value).to_s
	 
	  if value.empty?
	   puts "Invalid value.".bold.blue
	   
	  else 
	   saveSetting = File.new(name,"w")
	   saveSetting.puts(value)
	   saveSetting.close
	   puts "#{name} -> #{value}"
	   puts "Path variable saved!\n".bold.green
	   Dir.chdir prev_dir # Go back where user was before
	   break
	  end
	 end

end

def DeletePathVariable(prev_dir, path_dir)

puts "Delete Path Variable\n".bold.cyan

 if Dir.pwd != path_dir
  puts "Current dir - #{Dir.pwd}"
  puts "Expected to be in - #{path_dir}"
  puts "Directory error occurred."; system("pause"); exit
 end

puts "Type '" << "EnD".bold.white << "' to go back to command shell."
puts "Type '" << "list all".bold.white << "' to list path variables." 

loop do

print "File: "; file = gets.chomp

  if file == "EnD"
   puts "Quit.".bold.yellow
   Dir.chdir prev_dir
   break
  
  elsif file == "list all"  
   puts "Name  &  Value".bold.cyan
   contents = Dir.glob'*'
   
    contents.each do |list|
     next if File.directory?(list) || File.size?(list) >= 3000
	
	 value = File.read(list); value = /([A-Z|a-z]:\\[^*|"<>?\n]*)|(\\\\.*?\\.*)/.match(value).to_s
    
     puts "#{list}".bold.green; puts "#{value}".bold.yellow
	 puts "---------------------------- ".bold.white
    end
   
  elsif File.exists?(file)
   File.delete(file)
   
     if File.exists?(file)
	  puts "#{file} couldn't be deleted."
	 else
	  puts "Path Variable deleted!\n".bold.green
	 end
   
  else
   puts "File does not exist\n".bold.red
  end

end
end
	
Dir.chdir path_dir

puts "Path Variable\n".bold.cyan
puts "1." << " New path variable.".bold.green
puts "2." << " Delete existing path variable.".bold.green
puts "3." << " Back to command shell.".bold.white

loop = 0; while loop <= 6

print "> "; choice = get_character.chr

 if loop == 6
  puts OUTTAATTEMPTS; system("pause"); exit
 end

	if choice == "1"
	 puts choice
	 NewPathVariable(prev_dir)
	 break
	
	elsif choice == "2"
	 puts choice
	 DeletePathVariable(prev_dir, path_dir)
	 break
	
	elsif choice == "3"
	 puts "SeeWhyAnEyesee".bold.cyan << " B)\n".bold.magenta
	 Dir.chdir prev_dir
	 break
	 
	else
	 puts choice
	end
	
loop += 1
end
end

system("cls")

puts "SETTINGs".bold.cyan
puts "More settings coming soon!\n".bold.white
puts "1. Path variables".bold.green
puts "   Assign names to custom paths for directory related operations.".bold.yellow
puts "2. Go back to command shell.".bold.white

 loop do 

  print "> "; choice = get_character.chr

  if choice == "1"
   PathVariable()
   break
  
  elsif choice == "2"
   puts "SeeWhyAnEyesee".bold.cyan << " B)\n".bold.magenta
   break
   
  else
   puts choice
  end
 end
end

#======================== SETTING COMMANDS ========================#
