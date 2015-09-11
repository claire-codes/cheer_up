require 'cheer_up/version'
require 'Thor'

module CheerUp
  class Cli < Thor
    desc 'cheer up "name"', 'cheers you up with a name if you provide one'
    long_desc <<-MEH
      A sarcastic phrase spoken by the Terminal, which probably
      won't cheer whoever it's directed at up.
    MEH

    def cheer_up(name = nil)
      phrases = [
        "My heart bleeds for you",
        "Sorry I wasn't listening, can you repeat that",
        "You'll live",
        "No one cares",
        "Get over yourself",
        "That's nice",
        "I'm playing the world's saddest song on the world's tiniest violin, just for you",
        "Everything's gonna be alright",
        "Oh dear",
        "Oh dearie me",
        "Don't worry, it might never happen",
        "Worse things have happened",
        "As a wise fish once said, don't worry be happy",
        "Calm down, calm down"
      ]

      cheer_up = "#{phrases.sample} #{name}".strip
      system("say \"#{cheer_up}\"") if osx?
      puts "#{cheer_up}"
    end

    no_commands do
      def osx?
        RbConfig::CONFIG['host_os'].downcase.include?('darwin')
      end
    end
  end
end
