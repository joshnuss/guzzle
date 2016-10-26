defmodule Guzzle.Concat do
  def concat(flow, path \\ "all"),
    do: [{path, join(flow)}]

  defp join(flow),
    do: Enum.map_join(flow, &extract/1)

  defp extract({_path, data}),
    do: data
end
