defmodule DialectTest do
  use ExUnit.Case
  doctest Dialect

  defmodule M do
    require Dialect

    Dialect.toml2valuefn("./test/test.toml", "fruit")
  end

  test "toml2valuefn" do
    assert M.value("apple") == 1
    assert M.value("orange") == 2
  end

  defmodule M1 do
    use Dialect

    def at_index(list, n), do: at(list, n)
    def at_key(map, k), do: at(map, k)
  end

  test "at" do
    assert M1.at_index([2, 4, 6], 1) == 4
    assert M1.at_key(%{a: 1, b: 2}, :a) == 1
  end
end
