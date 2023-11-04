module BookStore
  DISCOUNTS = [1.0, 0.95, 0.9, 0.8, 0.75]
  
  def self.calculate_price(basket)
    return 0.00 if basket.empty?

    groups = []
    until basket.empty?
      set = basket.to_set
      groups << set.size
      set.map{|book| basket.slice!(basket.index(book))}
    end

    while Set[3, 5] <= groups.to_set
      groups.slice!(groups.index(3))
      groups.slice!(groups.index(5))
      groups.push(4, 4)
    end

    groups.sum{|group| 8.00 * group * DISCOUNTS[group - 1]}
  end
end
