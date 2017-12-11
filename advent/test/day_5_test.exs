defmodule AdventTest.Day5Test do
  use ExUnit.Case
  alias Advent.Day5

  test "part 1" do
    assert Day5.solve_part_1("0\n3\n0\n1\n-3\n") == 5
  end

  test "part 2" do
    assert Day5.solve_part_2("0\n3\n0\n1\n-3\n") == 10
  end
end
