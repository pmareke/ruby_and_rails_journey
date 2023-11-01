class Bob
    def self.hey(sentence)
        if yell_question?(sentence)
            return "Calm down, I know what I'm doing!"
        elsif yell?(sentence)
            return "Whoa, chill out!"
        elsif question?(sentence)
            return "Sure."
        elsif silence?(sentence)
            return "Fine. Be that way!"
        else
            return "Whatever."
        end
    end

    class << self
      def yell?(sentence)
        sanitazed = sentence.strip
        sanitazed == sanitazed.upcase && sentence.count("a-zA-Z") > 0
      end

      def question?(sentence)
        sentence.strip[-1] == '?'
      end

      def yell_question?(sentence)
        question?(sentence) && yell?(sentence)
      end

      def silence?(sentence)
        sentence.strip =~ /\A\s*\Z/
      end
    end
end
