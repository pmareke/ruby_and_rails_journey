class Poker
  attr_accessor :best_hand, :values, :suits
  ROYAL = {'A' => 14, 'K' => 13, 'Q' => 12, 'J' => 11}

  def initialize(hands)
    scores = hands.map{find_best_hand(_1)}
    @best_hand = hands
      .each_with_index
      .select {|_, i| scores[i] == scores.max }
      .map(&:first)
  end

  private

  def find_best_hand(cards)
    @values = cards.map { |card| ROYAL[card[0..-2]] || card[0..-2].to_i }.sort
    @suits = cards.map { |card| card[-1] }

    score = values.reverse.reduce(1){ |sum, value| sum*10 + value }
    score += (sets_of(2) * 10**6 + sets_of(3) * 10**8 + straight * 10**9 + flush * 10**10 + full_house * 10**11 + sets_of(4) * 10**13 + straight_flush * 10**14 + sets_of(5) * 10**15)
  end

  def sets_of(n)
    sets = values.uniq.select { |uniq_val| values.select { |val| val == uniq_val}.length == n }
    (sets[0] || 0) + (sets[1] || 0)*10
  end

  def straight
    vals = values[-1] == 14 && values[0] == 2 ? [1] + values[0..3] : values
    (vals.min..vals.max).to_a == vals.sort ? vals.max : 0
  end

  def flush
    suits.uniq.length == 1 ? values.max : 0
  end

  def full_house
    set_of_3 = sets_of(3)
    pair = sets_of(2)
    set_of_3 != 0 && pair != 0 ? set_of_3 * 10 + pair : 0
  end

  def straight_flush
    flush != 0 ? straight : 0
  end
end
