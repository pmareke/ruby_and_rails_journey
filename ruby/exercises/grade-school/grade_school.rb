class School
  def initialize
    @grades = Hash.new([])
  end

  def add student, grade
    return false if roster.include? student

    @grades[grade] += [student]
    true
  end

  def roster
    @grades.sort_by(&:first).map { |(_, names)| names.sort }.flatten
  end

  def grade number
    @grades[number].sort
  end
end
