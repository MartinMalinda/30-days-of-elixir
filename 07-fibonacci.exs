defmodule Fibonacci do
  def fib(1), do: [0]
  def fib(2), do: [0, 1]
  def fib(list_length) do
    fib(3, [0, 1], 0, 1, list_length)
  end
  def fib(_, list, _, _, list_length) when length(list) == list_length do
    list
  end
  def fib(position, list, older, old, list_length) when position > 2 and is_list(list) do
    latest = (old + older)
    fib(position + 1, list ++ [latest], old, latest, list_length)
  end
end

ExUnit.start

defmodule FibTest do
  use ExUnit.Case

  import Fibonacci

  # test "fibonacci" do
  #   assert fib(0) == []
  #   assert fib(1) == [0]
  #   assert fib(2) == [0, 1]
  #   assert fib(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
  # end

  test "benchmark" do
    {microsecs, _} = :timer.tc fn -> fib(1000) end
    IO.puts "fib() took #{microsecs} microsecs"     # 7118 microsecs
  end

end

