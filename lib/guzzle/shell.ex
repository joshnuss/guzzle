defmodule Guzzle.Shell do
  def shell(command, params, data \\ nil) do
    [command, params]
    |> List.flatten
    |> Enum.join(" ")
    |> execute(data)
  end

  defp execute(command, _data = nil),
    do: Porcelain.shell(command).out
end
