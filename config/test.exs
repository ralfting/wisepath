use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wise_path, WisePathWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure tee database for local testing
config :wise_path, WisePath.Repo,
  url: System.get_env("WISEPATH_DATABASE_TEST_URL"),
  pool: Ecto.Adapters.SQL.Sandbox
