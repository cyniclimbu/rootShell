# This script is part of rootShell and is not interactive.

def check_files # CHECK IF SYSTEMFILES EXISTS
	# if Dir.exists?(ROOTSHELL)
	# $SYSDIRECTORY = Dir.pwd + '\rootShell'
	# $SYSSTATUS    = true
	if not Dir.exists?(WINDOWS) or not Dir.exists?(WINDOWS + '\SeeWhyAnEyeSee') # Look at line 10 to see why this is important.
	 $SYSSTATUS    = false
	elsif File.exists?(WINDOWS + '\seewhyaneyesee\path')
	 Dir.chdir WINDOWS + '\seewhyaneyesee'
		if not File.zero?("path")
		  readPath = IO.readlines("path")
		  sysdir   = readPath[0].chomp # c:\example\n => c:\example
		  
			if Dir.exists?(sysdir)
			 $SYSDIRECTORY = sysdir
			 $SYSSTATUS    = true
			else
			 $SYSSTATUS    = false
			end
		else
		 $SYSSTATUS = false
		end
	else
	 $SYSSTATUS = false
	end
Dir.chdir $prev_dir	
end # END OF METHOD check_files
#=======================================================================#
#=======================================================================#
def check_custom_dir
## NOT IN USE CURRENTLY ##
	if not defined?($custom_dir)
	 puts "Custom path is not defined.".bold.red; system("pause"); exit
	 
	elsif not defined?($CreateCustomDir) 
	 puts "Create custom directory is not defined.".bold.red; system("pause"); exit
	 
	end
	
	if Dir.exists?($custom_dir)
	 $customDirExists = true
	 
	elsif not Dir.exists?($custom_dir) and $CreateCustomDir == true
	 $customDirExists = false
	 Dir.mkdir($custom_dir)
	 
	elsif not Dir.exists?($custom_dir) and $CreateCustomDir == false
	 $customDirExists = false 
	 
	else 
	 puts SHELLERROR; system("pause"); exit
	end

end
#=======================================================================#
#=======================================================================#
def admin? # CHECK IF CURRENT SHELL HAS ADMINISTRATOR PRIVILEGE
 reg_key   = 'reg query "HKU\S-1-5-19"'
 $is_admin = system(reg_key) # true if debugging required
 system("cls")
 
if $is_admin == false

 puts "rootShell must run as administrator to begin.\n".bold.white
 puts "Message from my creator :D".bold.cyan
 puts "I can create a batch file for you to run it as administrator.".bold.cyan
 puts "And save it to desktop, if you want.".bold.cyan
 puts "Press 'Y' for yes :) & 'N' if you don't like me :(".bold.cyan
 loop = 0; while loop < 4
 
			print "> ".bold.white
			choice = get_character.chr
			
				if choice =~ /y/i
				 batch_file_to_admin ### CALL batch_file_to_admin ###
				 
				elsif choice =~ /n/i
				 sadFace = ["O","k","a","y"," ",":","("]
				 
				  sadFace.each do |sad|
				   print sad.bold.cyan
				   sleep 0.1
				  end; exit
				  
				else
				 puts "Given character is out of options.".bold.red
				end
				
		   loop += 1	
		   end
		   
 puts OUTTAATTEMPTS		 
 sleep 5; exit 
 
end

end # END OF METHOD admin?
#=======================================================================#
#=======================================================================#
def batch_file_to_admin

puts "Making a shell for you :]".bold.green
Dir.chdir ENV['HOME'] + '/desktop'
dir   = File.dirname $0  # GET DIRECTORY WHERE EXECUTED FILE IS LOCATED
shell = File.basename $0 # GET EXECUTED FILE NAME

batch = File.new("rootShell.bat","w")
batch.puts "@echo OFF"
batch.puts "cd #{dir}"
batch.puts "NET SESSION >nul 2>&1"
batch.puts "IF %ERRORLEVEL% EQU 0 ("
batch.puts "    ECHO Launching rootShell as admin."
batch.puts "    ruby #{shell}"
batch.puts "    PAUSE"
batch.puts ") ELSE ("
batch.puts "   echo ######## ########  ########   #######  ########  "
batch.puts "   echo ##       ##     ## ##     ## ##     ## ##     ## "
batch.puts "   echo ##       ##     ## ##     ## ##     ## ##     ## "
batch.puts "   echo ######   ########  ########  ##     ## ########  " 
batch.puts "   echo ##       ##   ##   ##   ##   ##     ## ##   ##   "
batch.puts "   echo ##       ##    ##  ##    ##  ##     ## ##    ##  "
batch.puts "   echo ######## ##     ## ##     ##  #######  ##     ## "
batch.puts "   echo."
batch.puts "   echo."
batch.puts "   echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########"
batch.puts "   echo This script must be run as administrator to work   "
batch.puts '   echo Right click on my file icon and select "Run As Administrator".'
batch.puts "   echo ##########################################################"
batch.puts "   echo Original script by : stackoverflow.com/users/67268/blak3r"
batch.puts "   echo."
batch.puts "   PAUSE"
batch.puts "   EXIT /B 1"
batch.puts ")"
batch.puts "@echo ON"
batch.close

puts " Done!"; puts " Go to desktop, right-click on the batch file "
puts %Q(                and click "Run as administrator")
sleep 4; exit

end
#=======================================================================#
#=======================================================================#
def what2do


def locate_rootShell
system("cls")

def find_rootShell #### THIS IS A METHOD INSIDE locate_rootShell ####

	if Dir.exists?(ROOTSHELL) # I WON'T CHECK IF THE CONTENTS OF rootShell ARE IN PLACE OR NOT
	 print "Writing new path to".bold.green; puts " #{WINDOWS + '\SeeWhyAnEyeSee'}\n".bold.cyan
	 
	 Dir.chdir ROOTSHELL; rootShell_contents = Dir.glob'*'; installed_Path = Dir.pwd
	 Dir.chdir WINDOWS
		if File.exists?(WINDOWS + '\SeeWhyAnEyeSee\path')
		 Dir.chdir("SeeWhyAnEyeSee")
		 
		 savePath = File.new("path","w")
		 savePath.puts(installed_Path)
		 savePath.puts(File.dirname installed_Path)
		 savePath.close
		 
		 found_rootShell = true
		 
		elsif not Dir.exists?("SeeWhyAnEyeSee")
		 Dir.mkdir("SeeWhyAnEyeSee"); Dir.chdir("SeeWhyAnEyeSee")
		 
		 savePath = File.new("path","w")
		 savePath.puts(installed_Path)
		 savePath.puts(File.dirname installed_Path)
		 savePath.close
		 
		 found_rootShell = true
		 
		elsif not File.exists?(WINDOWS + '\SeeWhyAnEyeSee\path')
		 Dir.chdir("SeeWhyAnEyeSee")
		 
		 savePath = File.new("path","w")
		 savePath.puts(installed_Path)
		 savePath.puts(File.dirname installed_Path)
		 savePath.close
		 
		 found_rootShell = true
		 
		else
		 SHELLERROR; system("pause"); exit
		end
		
			if found_rootShell == true
				if rootShell_contents.empty? == true # IF ROOTSHELL IS EMPTY
				 print "We found rootShell but it ".bold.green; puts "was empty.".bold.red
				 puts "Which means all rootShell configuration has been deleted. If you had any.".bold.yellow
				 
				else puts "We found rootShell, yay!".bold.cyan 
				end
			puts "\nPlease restart rootShell to start using it.".bold.white; sleep 8; exit	
			end
	 
	elsif not Dir.exists?(ROOTSHELL)
	 puts "rootShell does not exist on this directory.".bold.white
	 
	else
	 SHELLERROR
	end

end #### THIS IS A METHOD INSIDE locate_rootShell ####

puts "LOCATE.".bold.blue
puts "Where is rootShell located at?".bold.green

 loop = 0; while loop <= 6 # LOOP OF LOCATE

  print "Path: ".bold.white; installed_Path = gets.chomp 
 
	if installed_Path =~ /rootShell/i
	 installed_Path = File.dirname installed_Path # c:\example\lol\rootShell => c:\example\lol
	 
		if Dir.exists?(installed_Path)
		 Dir.chdir(installed_Path)
		 find_rootShell 
		end
	
	elsif Dir.exists?(installed_Path)
	 Dir.chdir(installed_Path)
	 find_rootShell
	 
	elsif not Dir.exists?(installed_Path)
	 print "The specified directory does ".bold.white; puts "not exist.".bold.red
	 
	else
	 SHELLERROR
	end
	
 loop += 1
 end # LOOP OF LOCATE
 puts OUTTAATTEMPTS
end


def install #### THIS IS METHOD INSIDE what2do ####
system("cls")

 if $is_admin == false # JUST IN CASE ;)
 puts " HOLD IT RIGHT THERE!".bold.cyan
 puts " You need to run rootShell as administrator to do this.".bold.cyan; system("pause"); exit
 end

puts "INSTALLING\n".bold.cyan # More like creating directories and files :P
print "Mini path:".white; puts " #{File.basename $install_PATH}".bold.white
##---------------------------------------------------##
puts "\nChecking install directory.".bold.green

	if not Dir.exists?($install_PATH)
	 print " The directory does "; puts "not exist.".bold.red
	 print " #{$install_PATH}"; puts " not found.".bold.yellow
	 puts  " Install aborted.".bold.red; system("pause"); exit
	end
##---------------------------------------------------##
Dir.chdir($install_PATH)
installed_directory = Dir.pwd # GETS ABSOLUTE PATH E.G mypath => c:\example\mypath
##---------------------------------------------------##
puts "\nChecking for previously made system directory.".bold.green

	if Dir.exists?(ROOTSHELL)
	 puts "- Removing previously made system directory.\n".bold.yellow
	 system("rmdir /Q /S rootShell")
	 sleep 0.4
	 
		if Dir.exists?(ROOTSHELL)
		 puts "- An error occurred while removing rootShell.".bold.red; system("pause"); exit
		end
	end
##---------------------------------------------------##
puts "\nCreating rootShell directory.".bold.green	

 Dir.mkdir(ROOTSHELL); Dir.chdir(ROOTSHELL)
##---------------------------------------------------## 
puts "- Creating readme.txt".bold.yellow

readme = "Thanks for downloading rootShell!\nEmail: cyniclimbu@gmail.com\nNo hatemail pls."

createReadme = File.new("readme.txt","w")
createReadme.write(readme); createReadme.close
##---------------------------------------------------##
puts "- Creating message file.".bold.yellow

message = "Hi.\nHello.\nHallo frand :)\nYou must be smart.\nGood luck at it.\nHaving a good day?\nK den\nhvin' a giggle der m8?"

createMSG = File.new("message","w")
createMSG.puts(message); createMSG.close

puts "- Creating setting directory.".bold.yellow
Dir.mkdir("setting"); Dir.chdir("setting")
Dir.mkdir("path")
##---------------------------------------------------##
puts "\nChecking " << "#{WINDOWS}".bold.green << " directory." 
	
	if not Dir.exists?(WINDOWS)
	 puts WINDOWS << " was not found."
	 puts "If rootShell went full retard please contact me. Email is in readme.txt on #{Dir.pwd}".bold.cyan
	 system("pause"); exit
	end

Dir.chdir WINDOWS
##---------------------------------------------------##	
puts "- Creating directory SeeWhyAnEyeSee on #{WINDOWS}".bold.yellow

	if Dir.exists?("SeeWhyAnEyeSee")
	 system("rmdir /Q /S SeeWhyAnEyeSee") # DELETE SeeWhyAnEyeSee FROM CMD
	 sleep 0.4
	 
		if Dir.exists?("SeeWhyAnEyeSee")
		 puts "- An error occurred while removing #{WINDOWS << '\SeeWhyAnEyeSee'}.".bold.red; system("pause"); exit
		end

	end
##---------------------------------------------------##
Dir.mkdir("SeeWhyAnEyeSee"); Dir.chdir("SeeWhyAnEyeSee")

puts "- Writing path to #{WINDOWS + '\SeeWhyAnEyeSee'}"
createPath = File.new("path","w")

createPath.puts(installed_directory + '\rootShell')
createPath.puts(installed_directory)

createPath.close	

puts "\nFinished installing!".bold.cyan; puts "Please restart rootShell to start using it."
sleep 8; exit
##---------------------------------------------------##
end #### THIS IS METHOD INSIDE what2do ####

admin? # RUN METHOD admin? TO CHECK IF CURRENT SHELL IS RUNNING AS ADMINISTRATOR

puts  "What's up?".bold.green
puts  "You are seeing this because rootShell couldn't find it's system directory.".bold.yellow
print "Either you ".bold.yellow; print "misplaced ".bold.white; print "rootShell's system directory or ".bold.yellow; puts "it's your fist time.".bold.white
puts  "=========================================================\n"
puts " I N S T A L L E R\n".bold.green
puts " PRESS NUMBER".bold.green
puts " 1 - Begin install".bold.green
puts "     Requires administrator privilege.".bold.cyan
puts " 2 - Locate rootShell".bold.green
puts "     Only if you installed previously.".bold.yellow
puts "     Requires administrator privilege".bold.cyan
puts " 3 - Abort Installation.".bold.green

loop = 0; while loop < 6 # LOOP FOR INSTALLER

print " > ".bold.white; choice = get_character.chr

	if choice == "1"
	
	 puts "  INSTALL".bold.blue
	 puts " 1 - Default.".bold.green
	 puts "     Install on desktop.".bold.yellow
	 puts " 2 - Custom.".bold.green
	 puts "     Install on custom directory.".bold.yellow
	 puts " ----------------------------".bold.cyan
	 puts " It's NEAT & CLEAN either way.".bold.white 
	 
	 loop = 0; while loop < 4 # LOOP FOR INSTALL
	 
	  print "> "; choice = get_character.chr
		
		if choice == "1"; puts choice
		 
		 $install_PATH = ENV['HOME'] + '/desktop'
		 install # CALL METHOD install
		 
		elsif choice == "2"; puts choice
		 puts  "\nPlease provide path for where you want to install rootShell system files.".bold.green
			loop = 0; while loop < 6
			
			 print "Path: ".bold.white; install_TO = gets.chomp
			
				if Dir.exists?(install_TO)
				 $install_PATH = install_TO
				 install # CALL METHOD install
				
				elsif not Dir.exists?(install_TO)
				 print "Given directory does".bold.white; puts " not exist.".bold.red
				 
				else
				 puts SHELLERROR 
				end
			
			loop += 1
			end
		else
		 puts "Given character is out of options.".bold.red
		end
		
	 loop += 1
	 end # LOOP FOR INSTALL
	 
	elsif choice == "2"; puts choice
	 locate_rootShell # CALL METHOD locate_rootShell
	 
	elsif choice == "3"; print "  EXIT - ".bold.blue
	 sayBye = %w(B y e \ B y e !)
	 
	 sayBye.each do |bye|
	  print bye.bold.green; sleep 0.1
	 end; exit
	
	else
	 puts "Given character is out of options.".bold.red
	end

loop += 1
end # LOOP FOR INSTALLER

puts OUTTAATTEMPTS

end








