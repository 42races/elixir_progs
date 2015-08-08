defmodule ProjectEuler.P4 do
  @moduledoc """
    A palindormic number reads the same both ways.
    The largest palindrome made from the product of
    two 2-digit numbers is 9009, which is 91 times 99.
    Find the largest palindrome made from the product
    of two 3-digit numbers.
  """

  def solve do
    n = 999
    IO.puts palindrome_with(n)
  end

  def palindrome_with(n) when n > 100 do
    str = Integer.to_string(n)
    str = str <> String.reverse(str)
    num = String.to_integer(str)

    if is_multiple_of_two_3digit_factors?(num) do
      num
    else
      palindrome_with(n-1)
    end

  end

  def palindrome_with(_) do
    IO.puts "Oops, no such number"
  end

  def is_multiple_of_two_3digit_factors?(num) do
    factors = Enum.filter(100..999, fn x -> rem(num, x) == 0 end)

    if length(factors) > 1 do
      product(factors, num)
    end
  end

  def product([h|t], num) do
    if !Enum.any?(t, fn x -> (x*h) == num end) do
      product(t, num)
    else
      true
    end
  end

  def product([], _num) do
    false
  end

  def is_palindrome?(n) when n >= 0 do
    n == reverse(n)
  end

  def reverse(n) do
    reverse_n(n, 0)
  end

  defp reverse_n(n, rev) when n > 9 do
    r = rem(n, 10)
    rev = (rev * 10) + r
    reverse_n(div(n, 10), rev)
  end

  defp reverse_n(n, rev) when n < 10 and n > 0 do
    (rev * 10) + n
  end

  defp reverse_n(0, rev) do
    rev
  end
end

ProjectEuler.P4.solve