defmodule Dialect do
  @moduledoc """
  Documentation for Dialect.
  """

  @doc """
  toml2valuefn(toml_file_path, toml_attribute_name)

  result:
  [function] value(k) -> v
  """
  defmacro toml2valuefn(path, attr) do
    
    kv = Toml.decode_file!(path) |> Map.get(attr) 
  
    for {k, v} <- kv do
      quote do

        def value(unquote(k)) do
          unquote(v)
        end
      
      end
    end
  end

  @doc """
  %{a: 1, b: 2} |> at(:a) -> 1
  [:a, :b, :c] |> at(0) -> :a
  """
  def at(map, key) when is_map(map) do
    Map.get(map, key)
  end
  def at(list, n) when is_list(list) and is_integer(n) do
    Enum.at(list, n)
  end

  defmacro __using__(_) do
    quote do
      import Dialect, only: [at: 2, toml2valuefn: 2]
      import Enum, only: [map: 2, filter: 2, reduce: 3, slice: 2, sort: 2, sort_by: 3, sum: 1, reverse: 1]
    end
  end
end
