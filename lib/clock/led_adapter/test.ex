defmodule Clock.LEDAdapter.Test do
  defstruct pin: 0, lit: false, history: []

  require Logger
  alias Clock.LEDAdapter

  @behaviour LEDAdapter

  @impl LEDAdapter
  def open(pin) do
    Logger.info("Opening #{pin}")

    __struct__(pin: pin, history: [:open])
    |> off()
  end

  @impl LEDAdapter
  def on(led) do
    Logger.info("On: #{inspect(led)}")
    %{led | lit: true, history: [:on | led.history]}
  end

  @impl LEDAdapter
  def off(led) do
    Logger.info("Off: #{inspect(led)}")
    %{led | lit: false, history: [:off | led.history]}
  end

  def history(led), do: Enum.reverse(led.history)
end
