# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  ADULT_AGE = 18
  SENIOR_AGE = 60

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age >= SENIOR_AGE ? 10 : 15
  end

  def watch_scary_movie?
    @age >= ADULT_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    if @member
      return "🍿"
    end
    raise NotMovieClubMemberError.new()
  end
end
