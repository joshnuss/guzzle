defmodule Guzzle.Concat do
  def concat(flow, path \\ "all"),
    do: [{path, concat_data(flow)}]

  defp concat_data(flow),
    do: Enum.map_join(flow, &extract/1)

  defp extract({path, data}),
    do: data
end
