defmodule ProjectEuler.P7 do
  def solve do
    limit = 10001
    IO.puts prime(limit)
  end

  def prime(1), do: 2
  def prime(2), do: 3

  def prime(n) do
    next_prime(prime(n-1))
  end

  def next_prime(n) do
    n = n + 2

    if is_prime?(n) do
      n
    else
      next_prime(n)
    end
  end

  def is_prime?(n) when n > 1 do
    !Enum.any?((2..div(n, 2)), fn x -> rem(n, x) == 0 end)
  end

  def is_prime?(_) do
    false
  end

end

ProjectEuler.P7.solve