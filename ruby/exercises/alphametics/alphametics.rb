class Alphametics

  def self.solve equation
    letters = equation.scan(/\w/).uniq
    not_zero_expr = equation.scan(/\b(.)\w/).flatten.uniq.map{"#{_1.downcase} != 0 && "}.join

    math_expr = equation.downcase.gsub(/\w+/) do |word|
      "(#{word.chars.reverse.map.with_index{|char,i| "#{char}*#{10**i}" }.join '+'})"
    end

    checker = eval "->#{letters.join(',').downcase}{ #{not_zero_expr}#{math_expr} }"
    (0..9).to_a.permutation(letters.size) do |numbers|
      return letters.zip(numbers).to_h if checker[*numbers]
    end
    {}
  end
end
