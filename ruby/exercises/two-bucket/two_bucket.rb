class TwoBucket
  attr_reader :first, :second, :goal, :moves, :goal_bucket, :other_bucket

  def initialize(small, large, goal, start)
    @buckets = [[small, 'one'], [large, 'two']].map { |data| Bucket.new(*data) }
    @first, @second = start == 'one' ? @buckets : @buckets.reverse
    @goal = goal
    @moves = 0
    @goal_bucket, @other_bucket = pour
  end

  private

  def pour
    until @buckets.map(&:level).any? { |l| l == goal }
      @moves += 1
      if first.level.zero?
        first.fill
      elsif second.capacity == goal
        second.fill
      elsif second.level < second.capacity
        first.transfer(second)
      else
        second.empty
      end
    end
    [outcome.first.name, outcome.last.level]
  end

  def outcome
    @buckets.partition { |b| b.level == goal }.map(&:first)
  end
end

class Bucket
  attr_reader :capacity, :name
  attr_accessor :level

  def initialize(capacity, name)
    @capacity = capacity
    @name = name
    @level = 0
  end

  def fill
    @level = capacity
  end

  def empty
    @level = 0
  end

  def transfer(other)
    free_space = other.capacity - other.level
    if level < free_space
      other.level += @level
      empty
    else
      other.fill
      @level -= free_space
    end
  end
end
