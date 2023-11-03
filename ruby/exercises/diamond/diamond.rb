class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a

    rows = letters.map.with_index do |letter, index|
      letter.ljust(index.next).rjust(letters.count)
    end
    
    rows = rows.map do |row| 
      "#{row}#{row.reverse[1..]}\n"
    end

    reverse_rows = rows.reverse[1..]

    [*rows, *reverse_rows].join
  end
end
