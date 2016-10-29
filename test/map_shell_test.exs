defmodule MapShellTest do
  use ExUnit.Case, async: true
  doctest Guzzle.Map.Shell

  alias Experimental.Flow
  import Guzzle.Map.Shell

  test "mapping shell" do
    files = [
      {"a.js", "var a=1;"},
      {"b.js", "var b=2;"}
    ] |> Flow.from_enumerable
    result = map_command(files, "cat -n") |> Enum.to_list

    assert result == [
      {"a.js", "     1\tvar a=1;"},
      {"b.js", "     1\tvar b=2;"}
    ]
  end
end
