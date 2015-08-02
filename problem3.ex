defmodule ProjectEuler.P3 do
  @moduledoc """
    What is the largest prime factor of the number 600851475143 ?
  """

  def solve do
    n = 600_851_475_143
    IO.puts greatest_primes_factor(n, 2)
  end

  @doc """
    find the greatest prime factor
  """
  def greatest_primes_factor(n, i) when i < div(n, 2) do
    case rem(n, i) do
      0 ->
        greatest_factor = div(n, i)

        if is_prime?(greatest_factor) do
          greatest_factor
        else
          greatest_primes_factor(n, i + 2)
        end

      _ -> greatest_primes_factor(n, i + 1)
    end
  end

  def greatest_primes_factor(_n, _i) do
    "No prime factors"
  end

  def is_prime?(n) when n > 1 do
    !Enum.any?((2..div(n, 2)), fn x -> rem(n, x) == 0 end)
  end

  def is_prime?(_) do
    false
  end

end

ProjectEuler.P3.solve