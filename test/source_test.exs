defmodule SourceTest do
  use ExUnit.Case
  doctest Guzzle.Source

  import Guzzle.Source

  test "single glob" do
    files = source("test/examples/*.html")
      |> Enum.to_list

    assert files == [{"test/examples/about.html", "<h1>About</h1>\n"},
                     {"test/examples/index.html", "<h1>Index</h1>\n"}]
  end

  test "multiple globs" do
    files = source(["test/examples/a*.html", "test/examples/i*.htm?"])
      |> Enum.to_list

    assert files == [{"test/examples/about.html", "<h1>About</h1>\n"},
                     {"test/examples/index.html", "<h1>Index</h1>\n"}]
  end
  test "search returns empty" do
    files = source("test/examples/*.noexist")
      |> Enum.to_list

    assert files == []
  end
end
