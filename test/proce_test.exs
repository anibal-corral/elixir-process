defmodule ProceTest do
  use ExUnit.Case
  doctest Proce

  test "greets the world" do
    assert Proce.hello() == :world
  end
end
