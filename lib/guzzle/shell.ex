defmodule Guzzle.Shell do
  def shell(command, params, data \\ nil) do
    [command, params]
    |> List.flatten
    |> Enum.join(" ")
    |> to_charlist
    |> execute(data)
  end

  defp execute(command, data) do
    {:ok, _pid, cmd} = :exec.run(command, [:stdin, :stdout])

    cmd
    |> write(data)
    |> write(:eof)
    |> read
  end

  def write(cmd, _data=nil), do: cmd
  def write(cmd, data) do
    :exec.send(cmd, data)
    cmd
  end

  def read(cmd) do
    receive do
      {:stdout, ^cmd, out} -> out
    end
  end
end
