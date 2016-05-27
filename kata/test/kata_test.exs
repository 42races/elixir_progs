defmodule KataTest do
  use ExUnit.Case
  doctest Kata

  test "converts arabic to roman" do
    pairs = [
      {0, ""},
      {1, "I"},
      {2, "II"},
      {3, "III"},
      {4, "IV"},
      {5, "V"},
      {6, "VI"},
      {7, "VII"},
      {8, "VIII"},
      {9, "IX"},
      {10, "X"},
      {28, "XXVIII"}
    ]

    Enum.each pairs, fn({arabic, roman}) -> assert Kata.converts(arabic) == roman end
  end

  # test "converts 11 to XI" do
  #   assert Kata.converts(11) == "XI"
  # end

end
