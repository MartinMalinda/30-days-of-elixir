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
    IO.puts older
    IO.puts old
    latest = (old + older)
    fib(position + 1, list ++ [latest], old, latest, list_length)
  end
end

Fibonacci.fib(4)
|> List.to_string
|> IO.puts