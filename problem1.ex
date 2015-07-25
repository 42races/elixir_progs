defmodule ProjectEuler.P1 do
  @moduledoc """
    IO.puts "If we list all the natural numbers below 10 that are multiples of 3
    or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of
    all the multiples of 3 or 5 below 1000."
  """

  defp multiples_of_3(limit) do
    gen_series(3, limit)
  end

  defp multiples_of_5(limit) do
    gen_series(5, limit)
  end

  defp multiples_of_15(limit) do
    gen_series(15, limit)
  end

  defp gen_series(m, limit) do
    Enum.filter (1..limit), fn(x) -> rem(x, m) == 0 end
  end

  def solve do
    Enum.sum(multiples_of_3(1000)) + Enum.sum(multiples_of_5(1000)) - Enum.sum(multiples_of_15(1000))
  end
end
