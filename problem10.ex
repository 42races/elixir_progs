defmodule ProjectEuler.P10 do
  def solve do
    limit = 2_000_000
    IO.puts sum(3, 2, limit)
  end

  def sum(prime, acc, limit) do
    if prime < limit do
      acc = acc + prime
      sum(next_prime(prime), acc, limit)
    else
      acc
    end
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
    if rem(n, 2) == 0 do
      false
    else
      prime_check(n, 3, div(n, 3))
    end
  end

  def is_prime?(_) do
    false
  end

  def prime_check(num, i, limit) when i <= limit do
    if rem(num, i) == 0 do
      false
    else
      prime_check(num, i+2, div(num, i+2))
    end
  end

  def prime_check(_num, _i, _limit) do
    true
  end
end

ProjectEuler.P10.solve