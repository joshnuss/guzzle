defmodule Guzzle.Application do
  use Application

  def start(_type, _args) do
    {:ok, _pid} = :exec.start
  end
end
