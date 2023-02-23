class ResistorColorDuo
  def self.value(code)
    colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
    code.take(2).map { |color| colors.index(color) }.join.to_i
  end
end
