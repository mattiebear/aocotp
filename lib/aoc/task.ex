defmodule Aoc.Task do
  @type runner() :: (binary() -> any())

  @callback runners() :: {runner(), runner()}
end
