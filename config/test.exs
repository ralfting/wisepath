use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wise_path, WisePathWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure the database for local testing
config :wise_path, WisePath.Repo,
  database: "wise_path_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure the database for GitHub Actions
if System.get_env("GITHUB_ACTIONS") do
  config :wise_path, App.Repo,
    username: "postgres",
    password: "postgres"
end
