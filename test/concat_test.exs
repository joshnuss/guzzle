defmodule ConcatTest do
  use ExUnit.Case
  doctest Guzzle.Concat

  import Guzzle.Concat

  test "multiple files" do
    [{path, data}] = [{"a.js", "let a=1;\n"}, {"b.js", "let b=2;\n"}]
                     |> concat("all.js")

    assert path == "all.js"
    assert data == "let a=1;\nlet b=2;\n"
  end

  test "single file" do
    [{path, data}] = [{"a.js", "let a=1;\n"}]
                     |> concat("all.js")

    assert path == "all.js"
    assert data == "let a=1;\n"
  end

  test "no files" do
    [{path, data}] = concat([], "all.js")

    assert path == "all.js"
    assert data == ""
  end

  test "without explicit name" do
    [{path, data}] = [{"a.js", "let a=1;\n"}]
                     |> concat

    assert path == "all"
    assert data == "let a=1;\n"
  end
end
