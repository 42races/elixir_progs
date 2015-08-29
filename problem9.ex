defmodule ProjectEuler.P9 do
  def solve do
    IO.puts generate(2, 1)
  end

  def generate(m, n) when n > 0 do
    sum = triplet(m, n) |> Enum.sum

    if sum == 1000 do
      triplet(m,n) |> Enum.reduce(1, fn x, acc -> acc * x end)
    else
      generate(m, n-1)
    end
  end

  def generate(m, n) when n == 0 do
    generate(m+1, m-1)
  end

  def triplet(m, n) when (m > n) do
    [(m*m) - (n*n), 2*m*n, (m*m) + (n*n)]
  end

  def triplet(_m, _n) do
    IO.puts "Invalid seed values for m and n"
  end
end

ProjectEuler.P9.solve