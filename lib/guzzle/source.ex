defmodule Guzzle.Source do
  alias Experimental.Flow

  def source(globs) do
    List.wrap(globs)
    |> Flow.from_enumerable(min_demand: 1)
    |> Flow.flat_map(&Path.wildcard/1)
    |> Flow.partition
    |> Flow.map(&to_record/1)
  end

  defp to_record(path),
    do: {path, File.read!(path)}
end
