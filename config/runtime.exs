import Config

case config_env() do
  :dev ->
    config :elixir_rest,
      app_name: "development",
      app_port: 8080

  :test ->
    config :elixir_rest,
      app_name: "testing",
      app_port: 8080
end
