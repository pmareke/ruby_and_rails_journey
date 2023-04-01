class CollatzConjecture
  def self.steps(number)
    steps = 0
    until number == 1
      raise ArgumentError if number < 1

      steps += 1
      number = number.even? ? number / 2 : number * 3 + 1
    end
    steps
  end
end