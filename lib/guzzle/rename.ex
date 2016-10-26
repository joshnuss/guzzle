defmodule Guzzle.Rename do
  alias Experimental.Flow

  def rename(flow, options) do
    flow
    |> Flow.from_enumerable
    |> Flow.map(&do_rename(&1, options))
  end

  defp do_rename({path, data}, fun) when is_function(fun),
    do: {fun.(path), data}

  defp do_rename({path, data}, options) do
    ext  = Keyword.fetch!(options, :ext)
    root = Path.rootname(path)
    path = Enum.join([root, ext])

    {path, data}
  end
end
