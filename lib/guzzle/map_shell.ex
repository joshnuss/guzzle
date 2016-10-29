defmodule Guzzle.Map.Shell do
  alias Experimental.Flow
  import Guzzle.Shell
  import Guzzle.Map

  def map_command(flow, command, args \\ []),
    do: map(flow, & transform(command, args, &1))

  defp transform(command, args, {path, data}),
    do: {path, shell(command, args, data)}
end
