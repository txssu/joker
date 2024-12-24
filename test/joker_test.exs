defmodule JokerTest do
  use ExUnit.Case
  doctest Joker

  test "greets the world" do
    assert Joker.hello() == :world
  end
end
