defmodule Advent.Day4 do
  @moduledoc """
  # Day 4: High-Entropy Passphrases

  http://adventofcode.com/2017/day/4
  """

  @spec solve_part_1(String.t()) :: integer
  def solve_part_1(passphrases) do
    count_valid_passphrases(passphrases, &no_duplicate_words?/1)
  end

  @spec solve_part_2(String.t()) :: integer
  def solve_part_2(passphrases) do
    count_valid_passphrases(passphrases, &valid_passphrase?/1)
  end

  defp count_valid_passphrases(passphrases, validate_fun) do
    passphrases
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.count(validate_fun)
  end

  defp valid_passphrase?(passphrase) do
    no_duplicate_words?(passphrase) and no_anagram_words?(passphrase)
  end

  defp no_duplicate_words?(passphrase) do
    length(Enum.uniq(passphrase)) == length(passphrase)
  end

  defp no_anagram_words?(passphrase) do
    passphrase_without_anagrams =
      passphrase
      |> Enum.map(fn(word) ->
        word
        |> String.graphemes()
        |> Enum.sort()
      end)
      |> Enum.uniq()
    length(passphrase_without_anagrams) == length(passphrase)
  end
end
