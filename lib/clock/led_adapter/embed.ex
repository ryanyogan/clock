defmodule Clock.LEDAdapter.Embed do
  alias Circuits.GPIO
  alias Clock.LEDAdapter

  @behaviour LEDAdapter

  @impl LEDAdapter
  def open(pin) do
    {:ok, led} = GPIO.open(pin, :output)
    led
  end

  @impl LEDAdapter
  def on(led) do
    GPIO.write(led, 1)
    led
  end

  @impl LEDAdapter
  def off(led) do
    GPIO.write(led, 0)
    led
  end

  @impl LEDAdapter
  def toggle(led, true = _on), do: on(led)
  def toggle(led, false = _off), do: off(led)
end
