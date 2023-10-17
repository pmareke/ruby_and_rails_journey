class TwelveDays
  DAYS = {
    first:    "a Partridge in a Pear Tree.",
    second:   "two Turtle Doves",
    third:    "three French Hens",
    fourth:   "four Calling Birds",
    fifth:    "five Gold Rings",
    sixth:    "six Geese-a-Laying",
    seventh:  "seven Swans-a-Swimming",
    eighth:   "eight Maids-a-Milking",
    ninth:    "nine Ladies Dancing",
    tenth:    "ten Lords-a-Leaping",
    eleventh: "eleven Pipers Piping",
    twelfth:  "twelve Drummers Drumming"
  }

  def self.song
    DAYS
      .reduce("") { |s, (k, v)| s + line(k) }
      .delete_suffix("\n")
  end

  private

  def self.line(day)
    "On the %s day of Christmas my true love gave to me: %s\n\n" \
      % [day, get_gifts(day)]
  end

  def self.get_gifts(day)
    case day
      when :first
        @gifts = DAYS[day]
      when :second
        @gifts.insert(0, DAYS[day] + ", and ")
      else
        @gifts.insert(0, DAYS[day] + ", ")
    end
  end
end
