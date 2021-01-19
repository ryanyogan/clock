import Config

config :clock,
  pins: %{1 => 26, 2 => 13, 3 => 6, 4 => 5, 5 => 16, 6 => 12},
  led_adapter: Clock.LEDAdapter.Embed
