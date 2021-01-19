defmodule Clock.LEDAdapter do
  @type pin :: non_neg_integer()
  @type led_state() :: any()

  @callback open(pin) :: led_state()
  @callback on(led_state()) :: led_state()
  @callback off(led_state()) :: led_state()
  @callback toggle(led_state(), boolean()) :: led_state()

  def open(pin, adapter \\ Application.get_env(:clock, :led_adapter)) do
    led = adapter.open(pin)
    {led, adapter}
  end

  def on({led, adapter}), do: {adapter.on(led), adapter}

  def off({led, adapter}), do: {adapter.off(led), adapter}

  def toggle({led, adapter}, state), do: {adapter.toggle(led, state), adapter}
end
