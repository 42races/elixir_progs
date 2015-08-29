defmodule ProjectEuler.P6 do
  def solve do
    sum_of_squares = Enum.map(1..100, fn x -> x * x end) |> Enum.reduce(0, fn x, acc -> acc + x end)
    sum = Enum.reduce(1..100, 0, fn x, acc -> acc + x end)
    IO.puts (sum * sum) - sum_of_squares
  end
end

ProjectEuler.P6.solve