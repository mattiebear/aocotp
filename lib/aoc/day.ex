defmodule Aoc.Day do
  @type runner() :: (binary() -> any())

  @callback runners() :: {runner(), runner()}
end
