use Mix.Config

config :wise_path, WisePathWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :wise_path, WisePath.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool_size: String.to_integer(System.fetch_env!("POOL_SIZE")),
  url: System.fetch_env!("DATABASE_URL"),
  ssl: true

import_config "prod.secret.exs"
