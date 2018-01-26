defmodule Advent.Day5 do
  def solve_part_1(s) do
    s
    |> to_list_of_integers()
    |> jump(&part_1_modifier/1)
  end

  def solve_part_2(s) do
    s
    |> to_list_of_integers()
    |> jump(&part_2_modifier/1)
  end

  defp to_list_of_integers(s) do
    s
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp part_1_modifier(jump) do
    jump + 1
  end

  defp part_2_modifier(jump) do
    if jump >= 3, do: jump - 1, else: jump + 1
  end

  defp jump(list, jump_fn, index \\ 0, moves \\ 0) do
    value = Enum.at(list, index)

    if value == nil do
      moves
    else
      list = List.replace_at(list, index, jump_fn.(value))
      jump(list, jump_fn, index + value, moves + 1)
    end
  end
end
