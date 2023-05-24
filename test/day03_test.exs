defmodule Day03Test do
  use ExUnit.Case

  @example_input """
  vJrwpWtwJgWrhcsFMMfFFhFp
  jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
  PmmdzqPrVvPwwTWBwg
  wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
  ttgJtRGJQctTZtZT
  CrZsJsPPZsGzwwsLwLmpwMDw
  """

  test "part 1" do
    assert Day03.Part1.solve(@example_input) == 157
  end

  test "part 2" do
    assert Day03.Part2.solve(@example_input) == 70
  end
end
