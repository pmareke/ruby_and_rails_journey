class Brackets
  BRACKETS = { '{' => '}', '[' => ']', '(' => ')' }.freeze
  OPEN = ["[", "{", "("].freeze
  CLOSE = ["]", "}", ")"].freeze

  def self.paired? brackets
    brackets.chars.each_with_object([]) do |item, acc|
      if OPEN.include? item
        acc.push(item)
      end

      if CLOSE.include? item
        return false unless item == BRACKETS[acc.last]
        acc.pop
      end
    end.empty?
  end
end

