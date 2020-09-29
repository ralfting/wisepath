defmodule WisePath.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WisePathWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: WisePath.PubSub},
      # Start the Endpoint (http/https)
      WisePathWeb.Endpoint,
      # Start a worker by calling: WisePath.Worker.start_link(arg)
      # {WisePath.Worker, arg}
      WisePath.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WisePath.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WisePathWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
