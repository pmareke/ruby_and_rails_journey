class Grep
  def self.grep pattern, flags, filenames
    regexp_options = []
    regexp_options.push(Regexp::IGNORECASE) if flags.include? '-i'

    pattern = "^#{pattern}\n$" if flags.include? '-x'
    regex = Regexp.new pattern, *regexp_options

    filenames.inject([]) do |acc, filename|
      File.open(filename, 'r') do |file|
        file.each_line.with_index do |line, line_number|
          prefix = filenames.length > 1 ? "#{filename}:" : ''
          prefix += "#{line_number + 1}:" if flags.include? '-n'

          if regex.match?(line) ^ flags.include?('-v')
            if flags.include? '-l'
              acc << filename
              break
            end

            acc << "#{prefix}#{line.chomp}"
          end
        end
      end
      acc
    end.join "\n"
  end
end
