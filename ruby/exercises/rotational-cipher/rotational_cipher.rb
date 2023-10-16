class RotationalCipher
  LOWER = [*'a'..'z']
  UPPER = LOWER.map(&:upcase)
  ALPHA = (LOWER + UPPER).join

  def self.rotate(message, steps)
    message.tr(ALPHA, (LOWER.rotate(steps) + UPPER.rotate(steps)).join)
  end
end
