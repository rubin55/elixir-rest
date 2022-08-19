defmodule ElixirRestTest do
  use ExUnit.Case
  doctest ElixirRest

  test "greets the world" do
    assert ElixirRest.hello() == :world
  end
end
