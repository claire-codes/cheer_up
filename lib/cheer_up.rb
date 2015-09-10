require "cheer_up/version"
require 'Thor'

module CheerUp 
	class Cli < Thor

	desc 'cheer up "name"', 'cheers you up with a name if you provide one'
	long_desc <<-MEH
	This is a longer description
	that I'm not going to fill out right now
	MEH

		def initialize
			@cheers = ["Howdy ho", "Up yours"]
		end

		def cheer_up(name=nil)
			cheer = "#{@cheers.sample} #{name}".strip
			system("say #{cheer}") if osx?
			puts "#{cheer}"
		end

		no_commands {
			def osx?
				RbConfig::CONFIG['host_os'].downcase.include?("darwin")
			end
		}
	end

end
