defmodule Clock.LEDAdapter.Dev do
  defstruct pin: 0, lit: false

  require Logger

  def open(pin) do
    Logger.info("Opening #{pin}")

    __struct__(pin: pin)
    |> off()
  end

  def on(led) do
    Logger.info("On: #{inspect(led)}")
    %{led | lit: true}
  end

  def off(led) do
    Logger.info("Off: #{inspect(led)}")
    %{led | lit: false}
  end

  def toggle(led, true = _on), do: on(led)
  def toggle(led, false = _off), do: off(led)
end
