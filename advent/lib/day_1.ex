defmodule Advent.Day1 do
  @moduledoc """
  # Day 1: Inverse Captcha

  http://adventofcode.com/2017/day/1
  """

  @spec solve(integer) :: integer
  def solve(num, step \\ 1)
  def solve(num, _) when num < 10, do: 0
  def solve(num, step) do
    num
    |> int_to_digits()
    |> create_pairs(step)
    |> Stream.map(&match_digits/1)
    |> Enum.sum()
  end

  defp int_to_digits(num) do
    num
    |> to_string()
    |> String.graphemes()
    |> Stream.map(&String.to_integer/1)
  end

  defp create_pairs(digits, step) do
    digits
    |> Stream.cycle()
    |> Stream.drop(step)
    |> Stream.zip(digits)
  end

  defp match_digits({x, x}), do: x
  defp match_digits(_), do: 0
end
