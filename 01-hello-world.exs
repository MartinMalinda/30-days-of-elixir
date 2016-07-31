# http://elixir-lang.org/getting-started/introduction.html


# add = fn(a, b) -> a + b end

# def add(a, b) do
#   a + b
# end
defmodule Second do
  def multiply(a, b), do: a * b
  def noting(a), do: a
end

defmodule First do

  def add(a, b) do
    a + b
  end

  def print() do
    4
      |> add(5)
      |> Second.multiply(4)
      |> IO.puts
  end
end


a = "5"
IO.puts "hello world" <> "5"
a = a <> "4"
IO.puts("hello world" <> a)

First.print()