defmodule Guzzle.Shell do
  def shell(command, params, data \\ nil) do
    [command, params]
    |> List.flatten
    |> Enum.join(" ")
    |> to_charlist
    |> execute(data)
  end

  defp execute(command, _data = nil) do
    {:ok, [stdout: out]} = :exec.run(command, [:stdin, :stdout, :sync])

    Enum.join( out )
  end

  defp execute(command, data) do
    {:ok, _pid, cmd} = :exec.run(command, [:stdin, :stdout])

    :exec.send(cmd, data)
    :exec.send(cmd, :eof)

    receive do
      {:stdout, ^cmd, out} -> out
    end
  end
end
