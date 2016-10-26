defmodule Guzzle.DestinationTest do
  use ExUnit.Case, async: false
  doctest Guzzle.Destination

  import Guzzle.Destination

  setup do
    File.rm_rf("/tmp/foo")

    :ok
  end

  test "creates directory & file" do
    [{"a.js", "let a=1;"}, {"b.js", "let b=2;"}] |> dest("/tmp/foo")

    assert File.dir?("/tmp/foo")

    assert File.exists?("/tmp/foo/a.js")
    assert File.read!("/tmp/foo/a.js") == "let a=1;"

    assert File.exists?("/tmp/foo/b.js")
    assert File.read!("/tmp/foo/b.js") == "let b=2;"
  end
end
