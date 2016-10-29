defmodule MapTest do
  use ExUnit.Case, async: true
  doctest Guzzle.Map

  alias Experimental.Flow
  import Guzzle.Map

  test "mapping" do
    files = [
      {"a.js", "var a=1;"},
      {"b.js", "var b=2;"}
    ] |> Flow.from_enumerable
    result = map(files, &transform/1) |> Enum.to_list

    assert result == [
      {"root/a.js", "function(){var a=1;}();"},
      {"root/b.js", "function(){var b=2;}();"}
    ]
  end

  defp transform({path, data}) do
    {"root/#{path}", "function(){#{data}}();"}
  end
end
