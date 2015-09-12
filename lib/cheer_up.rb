require 'cheer_up/version'
require 'Thor'

module CheerUp
  class Cli < Thor
    desc 'up "name"', 'cheers you up with a name if you provide one'
    long_desc <<-MEH
      A sarcastic phrase spoken by the Terminal, which probably
      won't cheer whoever it's directed at up.
    MEH

    def up(name = nil)
      phrases = [
        "My heart bleeds for you",
        "No one cares",
        "Get over yourself",
        "I'm playing the world's saddest song on the world's tiniest violin, just for you",
        "Everything's gonna be alright",
        "Cry me a river",
        "Oh dearie me",
        "It might never happen",
        "As a wise fish once said, don't worry be happy",
        "Calm down, calm down",
        "Always look on the bright side of life"
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
