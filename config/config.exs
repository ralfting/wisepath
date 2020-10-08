import Config

Code.eval_file("./config/dotenv.exs")

config :wise_path,
  generators: [binary_id: true],
  ecto_repos: [WisePath.Repo]

config :wise_path, WisePathWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "03HlOm+2vN4HMB2T/9RWPma+ZOYIL1AnapgOsBfM399/N99HqwJg+LSbos6p67dT",
  render_errors: [view: WisePathWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WisePath.PubSub,
  live_view: [signing_salt: "44H63hf6"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
