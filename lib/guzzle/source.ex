defmodule Guzzle.Source do
  alias Experimental.Flow

  defmacro __using__(_opts) do
    quote do
      alias Guzzle.Source
    end
  end

  def source(globs) do
    List.wrap(globs)
    |> Flow.from_enumerable
    |> Flow.flat_map(&Path.wildcard/1)
    |> Flow.map(&path_to_record/1)
  end

  defp path_to_record(path),
    do: {path, File.read!(path)}
end
