use Mix.Config

config :wise_path, WisePathWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :wise_path, WisePath.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"}

import_config "prod.secret.exs"
