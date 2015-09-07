require "cheer_up/version"
require 'Thor'

module CheerUp 
	class Cli < Thor

	desc 'hello name', 'this will greet you'
	long_desc <<-MEH
	This is a longer description
	that I'm not going to fill out right now
	MEH

		def hello(name)
			`say "howdy ho #{name}"`
		end
	end
  
	# def self.cheer_up(name)
	# 	`say 'cheer up #{name}'`
	# 	puts "cheer up #{name}"
	# end

end
