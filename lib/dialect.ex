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
end
