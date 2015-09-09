require "cheer_up/version"
require 'Thor'

module CheerUp 
	class Cli < Thor

	desc 'hello name', 'this will greet you'
	long_desc <<-MEH
	This is a longer description
	that I'm not going to fill out right now
	MEH

		def initialize
			@cheers = ["Howdy ho", "Up yours"]
		end

		def hello(name=nil)
			cheer = @cheers.sample
			`say "#{cheer} #{name}"`
			name ? greeting = "#{cheer} #{name}" : greeting = "#{cheer}"
			puts greeting
		end
	end
  
	# def self.cheer_up(name)
	# 	`say 'cheer up #{name}'`
	# 	puts "cheer up #{name}"
	# end

end
