defmodule WisePathWeb.Api.HealthCheckController do
  use WisePathWeb, :controller

  def index(conn, _params) do
    json(conn, %{data: %{status: "ok"}})
  end
end
