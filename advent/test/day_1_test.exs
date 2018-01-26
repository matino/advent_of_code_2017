defmodule AdventTest.Day1Test.Part1 do
  use ExUnit.Case
  alias Advent.Day1

  test "single match" do
    assert Day1.solve(122) == 2
  end

  test "multiple matches of different digits" do
    assert Day1.solve(1122) == 3
  end

  test "multiple matches of the same digit" do
    assert Day1.solve(1111) == 4
  end

  test "no match for different digits" do
    assert Day1.solve(1234) == 0
  end

  test "first digit matches the last one" do
    assert Day1.solve(91_212_129) == 9
  end

  test "no match for single digit" do
    assert Day1.solve(2) == 0
  end
end

defmodule AdventTest.Day1Test.Part2 do
  use ExUnit.Case
  alias Advent.Day1

  test "all four digits match" do
    assert Day1.solve(1212, 2) == 6
  end

  test "no matches" do
    assert Day1.solve(1221, 2) == 0
  end

  test "both 2 are matching each other" do
    assert Day1.solve(123_425, 3) == 4
  end

  test "all digits match" do
    assert Day1.solve(123_123, 3) == 12
  end

  test "all 1s match" do
    assert Day1.solve(12_131_415, 4) == 4
  end
end
