defmodule Clock.LEDAdapter.Test do
  defstruct pin: 0, lit: false, history: []

  require Logger

  def open(pin) do
    Logger.info("Opening #{pin}")

    __struct__(pin: pin, history: [:open])
    |> off()
  end

  def on(led) do
    Logger.info("On: #{inspect(led)}")
    %{led | lit: true, history: [:on | led.history]}
  end

  def off(led) do
    Logger.info("Off: #{inspect(led)}")
    %{led | lit: false, history: [:off | led.history]}
  end

  def toggle(led, true = _on), do: on(led)
  def toggle(led, false = _off), do: off(led)

  def history(led), do: Enum.reverse(led.history)
end
