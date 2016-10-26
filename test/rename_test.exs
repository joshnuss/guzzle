defmodule RenameTest do
  use ExUnit.Case, async: true
  doctest Guzzle.Rename

  import Guzzle.Rename

  test "rename extensions" do
    files = [{"foo/a.js", "x=2"}, {"foo/b.javascript", "y=3"}]
    |> rename(ext: ".es6")
    |> Enum.to_list

    assert files == [{"foo/a.es6", "x=2"}, {"foo/b.es6", "y=3"}]
  end

  test "rename with function" do
    files = [{"foo/a.js", "x=2"}, {"foo/b.js", "y=3"}]
    |> rename(fn path -> "new_root/#{path}" end)
    |> Enum.to_list

    assert files == [{"new_root/foo/a.js", "x=2"}, {"new_root/foo/b.js", "y=3"}]
  end
end
