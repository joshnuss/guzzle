# Guzzle

A multi-core streaming build tool using Elixir's [GenStage](https://github.com/elixir-lang/gen_stage).

Inspired by Gulp.

## Example

```elixir
# In Guzzlefile.exs
import Guzzle.Jade
import Guzzle.Minify

task :jade do
  src("ux/**/*.jade")
  |> jade
  |> minify
  |> dest("www/templates")
end

task :watch do
  watch("ux/**/*.jade", :jade)
end
```

Then run:

```shell
guzzle watch
```

or

```shell
guzzle jade
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

Add `guzzle` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:guzzle, "~> 0.1.0"}]
end
```

## License

MIT
