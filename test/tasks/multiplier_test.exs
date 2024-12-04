defmodule Aoc.Tasks.MultiplierTest do
  use ExUnit.Case

  @test_input "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

  @tag :filter
  test "multiplier/1 finds all of the multiplier calls" do
    assert Aoc.Tasks.Multiplier.multiply(@test_input) == 161
  end
end
