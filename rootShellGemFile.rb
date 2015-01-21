## This script is part of rootShell and is not interactive. ##
## This script won't work as colored gem is not loaded in this file. ##
# It will be loaded via rootShell.rb #
require 'highline'
require 'highline/import'
require 'win32ole'
require 'benchmark'
require 'digest' # OR require 'qwikcrypt' FOR AES
 include HighLine::SystemExtensions
# exit if defined?(Ocra) We won't be needing this for now.

ROOTSHELL     = "rootShell"
DEV           = "SeeWhyAnEyeSee"
VERSION       = "0.1"
SHELLERROR    = "An unknown error occurred, please check your input.\nMaybe a bug!"
OUTTAATTEMPTS = "OUT OF ATTEMPTS\nRestart the shell to try again.".bold.white
TIMER         = [0.00001,0.00001,0.01,0.001,0,0.0001,0.1,0.1,0.0001,0.0001,0.01,0.0000001]
PERCENTAGE    = (1..100)
DRIVENAME     = /^[(a-z)]:/i.match(Dir.pwd).to_s # GET CURRENT DRIVE NAME E.G: C:, D:, E:
WINDOWS       = DRIVENAME + '\windows'

=begin
 This file is a part of rootShell project.
 This file contains required gems and constants for rootShell to work. Without this file rootShell won't work at all.
=end