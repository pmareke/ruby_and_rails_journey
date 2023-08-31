module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    identifier = ship_identifier.to_s
    cargo = identifier[0..2]
    cargo.start_with?("OIL", "GAS") ? :A : :B
  end
end
