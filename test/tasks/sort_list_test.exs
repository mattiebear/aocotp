defmodule Aoc.Tasks.SortListTest do
  use ExUnit.Case

  @test_input ~s"""
    3 4
    4 3
    2 5
    1 3
    3 9
    3 3
  """

  test "computes difference" do
    assert Aoc.Tasks.SortList.difference(@test_input) == 11
  end

  test "computes similarity" do
    assert Aoc.Tasks.SortList.similarity(@test_input) == 31
  end
end
