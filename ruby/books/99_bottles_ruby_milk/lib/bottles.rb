class Bottles
  def verse(line)
    first_line(line) + second_line(line)
  end

  def verses(first, last)
    verse_lines = (last..first).to_a.reverse
    lines = verse_lines.inject([]) { |acc, line| acc << verse(line) }
    lines.join("
")
  end

  def song
    verses(99, 0)
  end

  private

  def first_line(line)
    case line
    when 0
      return "No more bottles of milk on the wall, " + "no more bottles of milk.
"
    when 1
      return "1 bottle of milk on the wall, " + "1 bottle of milk.
"
    end
    return "#{line} bottles of milk on the wall, " + "#{line} bottles of milk.
"
  end

  def second_line(line)
    case line
    when 0
      return "Go to the store and buy some more, " + "99 bottles of milk on the wall.
"
    when 1
      return "Take it down and pass it around, " + "no more bottles of milk on the wall.
"
    when 2
      return "Take one down and pass it around, " + "1 bottle of milk on the wall.
"
    end
    return "Take one down and pass it around, " + "#{line - 1} bottles of milk on the wall.
"
  end
end
