defmodule Kata do

  @numerals [{10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}]

  def converts(n) do
    converts(n, @numerals)
  end

  def converts(n, _) when n < 1 do
    ""
  end

  def converts(n, [{arabic, roman} | tail]) when n >= arabic do
    roman <> converts(n - arabic, [{arabic, roman} | tail])
  end

  def converts(n, [{arabic, roman} | tail]) do
    converts(n, tail)
  end
end
