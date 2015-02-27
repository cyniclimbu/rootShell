#======================== DIRECTORY RELATED COMMANDS ========================#
def cd

current_directory = "Relative path".bold.cyan << " - " << "#{Dir.pwd.gsub('/','\\')}".bold.white << " | " << "Absolute path".bold.cyan << " - " << "#{File.basename Dir.pwd}\n".bold.white

	if current_directory.length > 162 #IF CD02
	 print "Relative path".bold.cyan << " - "; puts "#{Dir.pwd}".bold.white
 	 print "Absolute path".bold.cyan << " - "; puts "#{File.basename Dir.pwd}\n".bold.white
	 
	else # ELSE CD02 
	 puts current_directory
	end  # IF CD02

end

def cd_to_dir

path_dir = $SYSDIRECTORY + '\setting\path' # ..rootshell\setting\path

   if $cd2dir.empty?
	# I'll just leave this empty...
   else
    
	if Dir.exists?(path_dir)
	 short_dir = true
	else # CAN BE USED check_custom_dir from main_methods.rb instead of this if/else statement
	 # short_dir = false
	 # Dir.mkdir(path_dir)  # This will only work if the last dir is missing
	 short_dir = false   # In this case if '\setting' is missing .mkdir would fail.
	end

	if Dir.exists?($cd_to_dir) ### cd does not support chd to absolute paths with space e.g cd a stuff wouldnt work ###
	 Dir.chdir($cd_to_dir)     ### cd c:\users\w4r10ck\desktop\root\a stuff would be the only solution to this, fix it! ###
	 
	elsif Dir.exists?($cd2dir.join)
	 Dir.chdir($cd2dir.join)
	 
	elsif short_dir # true
	 Dir.chdir(path_dir)
	 
	 if File.exists?($cd2dir[0]) and File.zero?($cd2dir[0]) == false and File.size?($cd2dir[0]) <= 3000 # 3 KB
	  short_path = File.read($cd2dir[0]).chomp
		if Dir.exists?(short_path)
		 Dir.chdir(short_path)
		else  
		 puts "The system cannot find the path specified.\n".bold.red
		 Dir.chdir($prev_dir)
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

end

def dir
	contents = Dir.glob'*'
	puts "\nDirectory of ".bold.white << "#{Dir.pwd.capitalize}\n".bold.green
	 
	contents.each do |list|
	 
	 if File.directory?(list) 
	  puts "#{list}".bold.white << " - " << "Directory.".bold.green
	   
	 elsif File.file?(list)
	  puts "#{list}".bold.cyan << " - " << "File.".bold.green
	  
	 else
	  puts "#{list}".bold.cyan << " - " << "Unknown type.".bold.red
	 end
	end
end

def dir_extension(command)
extension = command.scan(/\S+ ?/)

 if extension[0] != "dir " || extension.size >= 4 
  puts "Invalid command or extension.".bold.blue
  
 else
  extension = extension.delete_at(2)
	
  if not extension.include?(".")
   extension = "." << extension
  end  
	
  puts "\nDirectory of ".bold.white << "#{Dir.pwd.capitalize}\n".bold.green
  puts "Filter: ".bold.green << "#{extension}\n".bold.white
	  
  extension = Dir.glob"*#{extension}"
	  
  extension.each do |list|
   puts list.bold.cyan
  end
	  
end
puts "\n" 
end

def dir_folder
contents = Dir.glob"*"

puts "\nDirectory of ".bold.white << "#{Dir.pwd.capitalize}\n".bold.green
puts "Filter: ".bold.green << "Folder only\n".bold.white

   contents.each do |list|
    next if File.file?(list)
    puts list.bold.cyan
   end
 
puts "\n"
end

def dir_file
contents = Dir.glob"*"

puts "\nDirectory of ".bold.white << "#{Dir.pwd.capitalize}\n".bold.green
puts "Filter: ".bold.green << "File only\n".bold.white

   contents.each do |list|
    next if File.directory?(list)
    puts list.bold.white
   end
 
puts "\n"
end

#======================== DIRECTORY RELATED COMMANDS ========================#

#======================== FILE RELATED COMMANDS ========================#
def newFile(file)

	if file =~ /^(\s+.*|.*[\/:"?*|<>].*|.*\s+||.*\.)$/ or file.include?('\\') # Check for invalid file name characters
	  puts "Invalid file name.\n".bold.blue
	  
	elsif File.exists?(file)
	
	 puts "#{file} exists, do you want to replace it?(Y/N)"
	  loop do
	  
	   print "> "; choice = get_character.chr
	   
	     if choice =~ /y/i; puts "Yes\n"
		  
		  puts "Write to #{file} Type EnD to finish writing.".bold.green
		  openfile = File.open(file,"w")
		  
		   loop do
		    print "> "
		    content = gets.chomp
		     break if content == "EnD"
	 	     openfile.puts(content)
		    end
			
		   openfile.close
		   puts "Finished writing.\n".bold.green; break
		   
		 elsif choice =~ /n/i; puts "No\n"
	       puts "File was not over-written.\n".bold.cyan; break
		   
		 else puts "\n"  
		 end
	  end
	  
	else 

	 puts "Write to #{file} Type EnD to finish writing.".bold.green
	 newfile = File.new(file,"w")
	 
	  loop do
	  print "> "
	  content = gets.chomp
	   break if content == "EnD"
	   newfile.puts(content)
	  end
	  
	  newfile.close
	 puts "Finished writing.\n".bold.green
	
	end
end

def openFile(file)

	if file =~ /^(\s+.*|.*[\/:"?*|<>].*|.*\s+||.*\.)$/ or file.include?('\\') # Check for invalid file name characters
	  puts "Invalid file name.\n".bold.blue
	
	elsif not File.exist?(file)
	 puts "#{file} does not exist. Create as new file?(Y/N)"
	 
		loop do
	  
	     print "> "; choice = get_character.chr
	   
	      if choice =~ /y/i; puts "Yes\n"
		   puts "Write to #{file} Type EnD to finish writing.".bold.green
		   newfile = File.new(file,"a")
		   
		    loop do
		     print "> "
		     content = gets.chomp
		      break if content == "EnD"
	 	      newfile.puts(content)
		    end
			
		   newfile.close
		   puts "Finished writing.\n".bold.green; break
		   
		 elsif choice =~ /n/i; puts "No\n"
	       puts "New file was not created.\n".bold.cyan; break
		   
		 else puts "\n"  
		  end
	  end
	  
	else  
	
	puts "Write to #{file} Type EnD to finish writing.".bold.green
	openfile = File.open(file,"a")
	
	  loop do
	   print "> "
	   content = gets.chomp
	    break if content == "EnD"
	    openfile.puts(content)
	  end
	  
	openfile.close
    puts "Finished writing.\n".bold.green
	end
	
end
#======================== FILE RELATED COMMANDS ========================#


#======================== NETWORK COMMANDS ========================#
def ping(host)
ping = system("ping #{host}")
puts "\n"

end

#======================== OTHER COMMANDS ========================#
def message
prev_dir = Dir.pwd

	if Dir.exists?($SYSDIRECTORY)
	 Dir.chdir $SYSDIRECTORY
	 
	  if File.exists?("message") and File.size?("message") <= 3000
	  
	   msg = IO.readlines("message")
	   msg = msg.shuffle.pop.bold.cyan
	   
	  else 
	   msg = "Where are my files?".bold.green << " #{ENV["COMPUTERNAME"].gsub(/-pc/i,"").downcase}".bold.cyan << " AARGH!!\n".bold.red 
	  end # better than, system("echo %username%"), right?
	else 
	  msg = "Where are my files?".bold.green << " #{ENV["COMPUTERNAME"].gsub(/-pc/i,"").downcase}".bold.cyan << " AARGH!!\n".bold.red 
	end
	
puts "#{msg}\n"
Dir.chdir prev_dir

end

def text2md5
puts "Type EnD to quit."

  loop do
   print "String: "; string = gets.chomp
    break if string == "EnD"
   puts Digest::MD5.hexdigest(string).bold.white
   puts "\n"
   
  end
puts "\n"
end

def delete(content)
puts "Are you sure?(Y/N)".bold.green

loop do

print "> "; choice = get_character.chr

  if choice =~ /y/i
 
   if File.file?(content)
    File.delete(content)
	
	 if File.exists?(content)
	  print "Error".bold.red << " #{content} couldn't be deleted.\n\n"

	 else
	  print "#{content}".bold.cyan << " was deleted.\n\n"
	 end; break
	
   elsif File.directory?(content)
	system("rmdir #{content} /Q /S") # Umm... (._.) (`_`) ('_') (._.)
	
	 if Dir.exists?(content)
	  print "Error".bold.red << " #{content} couldn't be deleted.\n\n"

	 else
	  print "#{content}".bold.cyan << " was deleted\n\n"
	 end; break
	
   else
    puts "#{content}".bold.cyan << " is nowhere to be found.\n\n"; break
   end
 
  elsif choice =~ /n/i
   puts "#{content}".bold.cyan << " was not deleted.\n\n"; break
  
  else
   puts "\n"
  end
end
end

def explorer(target)
prev_dir = Dir.pwd
path_dir = $SYSDIRECTORY + '\setting\path' # ..rootshell\setting\path

	if Dir.exists?(path_dir)
	 short_dir = true
	else # CAN BE USED check_custom_dir from main_methods.rb instead of this if/else statement
	 # short_dir = false
	 # Dir.mkdir(path_dir)  # This will only work if the last dir is missing
	 short_dir = false   # In this case it's '\path' Is '\setting' is missing this won't work at all
	end

 if Dir.exists?(target) || File.exists?(target)  
  puts "Waiting.".bold.white
  system("explorer #{target}")
  
 elsif path_dir
  Dir.chdir path_dir
  
	 if File.exists?(target) and File.zero?(target) == false and File.size?(target) <= 3000 # 3 KB
	  short_path = File.read(target).chomp
	  
		if Dir.exists?(short_path) || File.exists?(target)
		 puts "Waiting.".bold.white
		 system("explorer #{short_path}")
		end
		
	 else 
	 print "#{target}".white.cyan << " does not exist or cannot be opened.\n\n".bold.green
	 end
 
 else
  print "#{target}".bold.white << " does not exist or cannot be opened.\n\n".bold.green
 end

Dir.chdir prev_dir

end

def hideContents(command,contents)

  if contents == "all"

   listContents = Dir.glob'*'

    listContents.each do |hide|
	 
	 system("attrib +s +h \"#{hide}\"")
	 
    end
  
  elsif contents == "single"
   
   if File.exists?(command) || Dir.exists?(command)
    system("attrib +s +h \"#{command}\"")  # command => single file/dir name
	
   else
    puts "#{command}".bold.cyan << " does not exist.\n".bold.red
   end
  end

end

def showContents(command,contents)

  if contents == "all"
   listContents = Dir.glob'*'

    listContents.each do |show|
	 
	 system("attrib -s -h \"#{show}\"")
	 
    end
  
  elsif contents == "single"
   system("attrib -s -h \"#{command}\"")  # command => single file/dir name
   
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
