defmodule Aoc.Tasks.ReactorReportTest do
  use ExUnit.Case

  @test_input ~s"""
  7 6 4 2 1
  1 2 7 8 9
  9 7 6 2 1
  1 3 2 4 5
  8 6 4 4 1
  1 3 6 7 9
  """

  test "safe_reports/1 calculates the correct value" do
    assert Aoc.Tasks.ReactorReport.safe_reports(@test_input) == 2
  end
end
