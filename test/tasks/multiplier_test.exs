defmodule Aoc.Tasks.MultiplierTest do
  use ExUnit.Case

  test "multiplier/1 finds all of the multiplier calls" do
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    assert Aoc.Tasks.Multiplier.multiply(input) == 161
  end

  @tag :filter
  test "conditional_multiply/1 finds all of the multiplier calls" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    assert Aoc.Tasks.Multiplier.conditional_multiply(input) == 48
  end
end
