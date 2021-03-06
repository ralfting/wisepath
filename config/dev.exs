import Config

config :wise_path, WisePath.Repo,
  pool_size: 10,
  url: System.get_env("DATABASE_URL")

config :wise_path, WisePathWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
