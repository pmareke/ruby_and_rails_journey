class PhoneNumber
  def self.clean(telephone_number)
    digits = telephone_number
      .delete(" ")
      .scan(/^(?:\+?1[-. ]?)?\(?([2-9][0-8][0-9])\)?[-. ]?([2-9][0-9]{2})[-. ]?([0-9]{4})$/).join
    return digits.empty? ? nil : digits
  end
end