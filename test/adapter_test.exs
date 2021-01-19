defmodule AdapterTest do
  use ExUnit.Case

  test "picks up testing adapter" do
    assert Application.get_env(:clock, :led_adapter) == Clock.LEDAdapter.Test
  end
end
