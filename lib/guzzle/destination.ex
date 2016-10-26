defmodule Guzzle.Destination do
  alias Experimental.Flow

  def dest(flow, path) do
    flow
    |> Flow.from_enumerable
    |> Flow.map(& write(path, &1))
    |> Enum.to_list
  end

  defp write(root, {path, data}),
    do: write({Path.join(root, path), data})

  defp write({path, data}) do
    File.mkdir_p(Path.dirname(path))

    File.write!(path, data)
  end
end
