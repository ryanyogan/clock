defmodule Clock.Led do
  require Logger
  alias Circuits.GPIO

  def open(pin) do
    Logger.info("Opening #{pin}")
    {:ok, led} = GPIO.open(pin, :output)
    led
  end

  def on(led) do
    Logger.info("On: #{inspect(led)}")
    GPIO.write(led, 1)
    led
  end

  def off(led) do
    Logger.info("Off: #{inspect(led)}")
    GPIO.write(led, 0)
    led
  end

  def toggle(led, true = _on), do: on(led)
  def toggle(led, false = _off), do: off(led)
end
