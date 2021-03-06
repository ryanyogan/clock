defmodule Clock.LEDAdapter.Dev do
  defstruct pin: 0, lit: false
  require Logger
  alias Clock.LEDAdapter

  @behaviour LEDAdapter

  @impl LEDAdapter
  def open(pin) do
    Logger.info("Opening #{pin}")

    __struct__(pin: pin)
    |> off()
  end

  @impl LEDAdapter
  def on(led) do
    Logger.info("On: #{inspect(led)}")
    %{led | lit: true}
  end

  @impl LEDAdapter
  def off(led) do
    Logger.info("Off: #{inspect(led)}")
    %{led | lit: false}
  end
end
