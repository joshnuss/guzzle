defmodule ShellTest do
  use ExUnit.Case, async: true
  doctest Guzzle.Shell

  import Guzzle.Shell

  test "executes program with arguments" do
    assert shell("echo", ["a", "b"]) == "a b\n"
  end

  test "executes program without arguments" do
    assert shell("echo", []) == "\n"
  end

  test "passes data to stdin" do
    assert shell("cat", [], "hello\nworld\n") == "hello\nworld\n"
  end
end
