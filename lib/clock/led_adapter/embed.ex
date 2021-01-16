defmodule Clock.LEDAdapter.Embed do
  alias Circuits.GPIO

  def open(pin) do
    {:ok, led} = GPIO.open(pin, :output)
    led
  end

  def on(led) do
    GPIO.write(led, 1)
    led
  end

  def off(led) do
    GPIO.write(led, 0)
    led
  end

  def toggle(led, true = _on), do: on(led)
  def toggle(led, false = _off), do: off(led)
end
