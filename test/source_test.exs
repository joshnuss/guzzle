defmodule SourceTest do
  use ExUnit.Case
  doctest Guzzle.Source

  import Guzzle.Source

  test "single glob" do
    files = source("test/fixtures/*.html")
      |> Enum.to_list

    assert files == [{"test/fixtures/about.html", "<h1>About</h1>\n"},
                     {"test/fixtures/index.html", "<h1>Index</h1>\n"}]
  end

  test "multiple globs" do
    files = source(["test/fixtures/a*.html", "test/fixtures/i*.htm?"])
      |> Enum.to_list

    assert files == [{"test/fixtures/about.html", "<h1>About</h1>\n"},
                     {"test/fixtures/index.html", "<h1>Index</h1>\n"}]
  end

  test "search returns empty" do
    files = source("test/fixtures/*.noexist")
      |> Enum.to_list

    assert files == []
  end
end
