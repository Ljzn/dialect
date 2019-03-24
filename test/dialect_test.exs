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
end
