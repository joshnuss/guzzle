defmodule Guzzle.Map do
  alias Experimental.Flow

  def map(flow, fun) do
    flow
    |> Flow.map(fun)
  end
end
