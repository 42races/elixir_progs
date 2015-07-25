defmodule ProjectEuler.P2 do

  @moduledoc """
    By starting with 1 and 2, the first 10 terms will be: 1, 2, 3, 5, 8, 13, 
    21, 34, 55, 89, ... By considering the terms in the Fibonacci sequence whose
    values do not exceed four million, find the sum of the even-valued terms.
  """

  @doc """
    generates fibonacci series and add up till the limit
  """
  def sum(acc, prev, cur) when cur < 4_000_000 do
    acc  = acc + cur
    sum(acc, cur, prev + cur)
  end

  def sum(acc, _prev, _cur) do
    acc
  end
  
  def solve do
    sum(0, 1, 1)
  end
  
end
