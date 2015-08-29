defmodule ProjectEuler.P5 do
  def solve do
    all_factors = Enum.map(2..20, fn x ->
      factorize(x)
    end)

    lcm_factors = []
    lcm_factors = filter_lcm_factors(all_factors, lcm_factors)
    IO.puts Enum.reduce(lcm_factors, 1, fn x, acc -> x * acc end)
  end

  def filter_lcm_factors([h|t], lcm_factors) do
    acc = []
    lcm_factors = common_factors(h, lcm_factors, acc)
    filter_lcm_factors(t, lcm_factors)
  end

  def filter_lcm_factors([], lcm_factors) do
    lcm_factors
  end

  def common_factors([h|t], lcm_factors, acc) do
    if Enum.any?(lcm_factors, fn x -> h == x end) do
      acc = acc ++ [h]
      lcm_factors = List.delete(lcm_factors, h)
    else
      lcm_factors = lcm_factors ++ [h]
    end

    common_factors(t, lcm_factors, acc)
  end

  def common_factors([], lcm_factors, acc) do
    Enum.sort(lcm_factors ++ acc)
  end

  def factorize(num) when num > 1 do
    half = div(num, 2)

    if half < 2 do
      factors = [1, num]
    else
      factors = simple_factors(num)
    end

    factors
  end

  def factorize(_num) do
    IO.puts "Zero factors"
    []
  end

  def simple_factors(num) do
    to_simple_factors(2, num, [1])
  end

  def to_simple_factors(i, num, factors) when i <= num do
    if rem(num, i) == 0 do
      num = div(num, i)
      factors = factors ++ [i]
      i = 1
    end

    to_simple_factors(i+1, num, factors)
  end

  def to_simple_factors(_i, num, factors) do
    if num > 1 do
      factors = factors ++ [num]
    end

    Enum.sort(factors)
  end
end

ProjectEuler.P5.solve

