import Config

config :wise_path, WisePathWeb.Endpoint,
  server: true,
  load_from_system_env: true,
  http: [port: {:system, "PORT"}],
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443]
