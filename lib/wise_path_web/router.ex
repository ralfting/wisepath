defmodule WisePathWeb.Router do
  use WisePathWeb, :router

  alias WisePathWeb.Api

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Api, as: :api do
    pipe_through :api

    get "/health_check", HealthCheckController, :index
    resources "/paths", PathController, only: [:index, :create, :update, :delete, :show]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: WisePathWeb.Telemetry
    end
  end
end
