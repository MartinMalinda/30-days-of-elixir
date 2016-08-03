# http://elixir-lang.org/docs/stable/elixir/Map.html

ExUnit.start

defmodule MapTest do
  use ExUnit.Case

  def sample do
    %{foo: 'bar', baz: 'quz'}
  end

  test "Map.get" do
    assert Map.get(sample, :foo) == 'bar'
    assert Map.get(sample, :non_existent) == nil
    assert Map.get(sample, :foo) == sample.foo
    assert Map.fetch!(sample, :foo) == Map.get(sample, :foo)
  end

  test "Map.keys" do
    assert Map.keys(sample) == [:baz, :foo]
    sample2 = Map.update!(sample, :foo, fn val -> 'bar2' end ) # put is more straightforward
    assert sample2.foo == 'bar2'
  end

  test "[]" do
    assert sample[:foo] == 'bar'
    assert sample[:non_existent] == nil
  end

  test "." do
    assert sample.foo == 'bar'
    assert_raise KeyError, fn ->
      sample.non_existent
    end
  end

  test "Map.fetch" do
    {:ok, val} = Map.fetch(sample, :foo)
    assert val == 'bar'
    :error = Map.fetch(sample, :non_existent)
  end

  test "Map.put" do
    assert Map.put(sample, :foo, 'bob') == %{foo: 'bob', baz: 'quz'}
    assert Map.put(sample, :far, 'bar') == %{foo: 'bar', baz: 'quz', far: 'bar'}
  end

  test "pattern matching" do
    %{foo: a, baz: bar} = sample
    assert a == 'bar'
    assert bar == 'quz'
    # IO.puts sample3
  end

  test "merge, equality and drop" do
    assert Map.merge(%{a: 1}, %{a: 2}) == %{a: 2}
    assert %{a: 1, c: 2} == %{c: 2, a: 1}
    assert Map.drop(%{a: 1}, [:a]) == %{}
  end

  test "Map.values" do
    # Map does not preserve order of keys, thus we Enum.sort
    values = sample
    |> Map.values
    |> Enum.sort

    assert values == ['bar', 'quz']
  end
end

