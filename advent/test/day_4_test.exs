defmodule AdventTest.Day4Test do
  use ExUnit.Case
  alias Advent.Day4

  test "part 1" do
    assert Day4.solve_part_1(
      "aa bb cc dd ee
      aa bb cc dd aa
      aa bb cc dd aaa") == 2
  end

  test "part 2" do
    assert Day4.solve_part_2(
      "abcde fghij
      abcde xyz ecdab
      a ab abc abd abf abj
      iiii oiii ooii oooi oooo
      oiii ioii iioi iiio") == 3
  end
end
