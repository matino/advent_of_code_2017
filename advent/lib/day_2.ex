defmodule Advent.Day2 do
  @moduledoc """
  # Day 2: Corruption Checksum

  http://adventofcode.com/2017/day/2
  """

  @spec solve_part_1(String.t()) :: integer
  def solve_part_1(s) do
    s
    |> to_matrix()
    |> Enum.reduce(0, &max_min_difference/2)
  end

  @spec solve_part_2(String.t()) :: integer
  def solve_part_2(s) do
    s
    |> to_matrix()
    |> Enum.map(&permutate/1)
    |> Enum.map(&List.flatten/1)
    |> Enum.map(fn row -> Enum.map(row, &divide/1) end)
    |> List.flatten()
    |> Enum.sum()
  end

  defp to_matrix(s) do
    s
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(fn row -> Enum.map(row, &String.to_integer/1) end)
  end

  defp max_min_difference([], acc), do: acc

  defp max_min_difference(digits, acc) do
    {min, max} = Enum.min_max(digits)
    acc + max - min
  end

  defp permutate(digits) do
    digits
    |> Enum.map(fn x -> for digit <- digits, do: {x, digit} end)
  end

  defp divide({x, x}), do: 0
  defp divide({x, y}) when rem(x, y) == 0, do: div(x, y)
  defp divide({x, y}) when rem(x, y) != 0, do: 0
end
