# http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
# http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html

ExUnit.start                                # set up the test runner

defmodule MyTest do
  use ExUnit.Case                           # use requires a module and sets up macros; will explore more later

  test 'simple test' do
    assert 1 + 1 == 2
  end

  test "refute is opposite of assert" do    # test macro accepts string as test name
    refute 1 + 1 == 3
  end

  test :assert_raise do                     # test macro also accepts an atom
    assert_raise ArithmeticError, fn ->
      1 + "x"
    end
  end

  test 'deleting list items' do
    a = [1, 2, 3, 4]
      |> List.delete(1)
      |> List.delete_at(0)

    assert length(a) == 2
    assert a == [3, 4]

  end

  test "assert_in_delta asserts that val1 and val2 differ by less than delta." do
    assert_in_delta 1, # actual
                    5, # expected
                    6  # delta
  end

end
