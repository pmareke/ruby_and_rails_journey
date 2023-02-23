class BirdCount
  def initialize(birds_per_day)
    @birds = birds_per_day
  end

  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def yesterday
    @birds[-2]
  end

  def total
    @birds.sum
  end

  def busy_days
    busy_days = @birds.filter { |bird| bird >= 5 }
    busy_days.size
  end

  def day_without_birds?
    days_without_birds = @birds.filter { |bird| bird == 0 }
    days_without_birds.size > 0
  end
end
