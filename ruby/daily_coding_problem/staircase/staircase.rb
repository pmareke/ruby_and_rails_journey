class Staircase
  def initialize(final_step:, steps: [1, 2])
    @final_step = final_step
    @steps = steps
  end

  def solutions
    valid = (1..final_step).to_a.inject([]) do |valid, step|
      valid + possible_steps.permutation(step).to_a
    end
    valid.filter { |item| item.sum == final_step }.uniq.sort
  end

  private

  attr_reader :final_step, :steps

  def possible_steps
    steps.inject([]) { |acc, item| acc + [item] * final_step }
  end
end
