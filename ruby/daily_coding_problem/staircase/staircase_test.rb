require "minitest/autorun"
require_relative "staircase"

describe Staircase do
  describe "#solutions" do
    it "calculate the number of unique ways you can climb the staircase" do
      staircase = Staircase.new(final_step: 4)
      expect_steps = [
        [1, 1, 1, 1],
        [1, 1, 2],
        [1, 2, 1],
        [2, 1, 1],
        [2, 2],
      ]

      assert_equal expect_steps, staircase.solutions
    end

    it "calculate the number of unique ways you can climb the staircase with a given step" do
      staircase = Staircase.new(final_step: 4, steps: [1, 2, 3, 4])
      expect_steps = [
        [1, 1, 1, 1],
        [1, 1, 2],
        [1, 2, 1],
        [1, 3],
        [2, 1, 1],
        [2, 2],
        [3, 1],
        [4],
      ]

      assert_equal expect_steps, staircase.solutions
    end
  end
end
