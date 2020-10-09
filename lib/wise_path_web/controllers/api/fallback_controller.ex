defmodule WisePathWeb.Api.FallbackController do
  use WisePathWeb, :controller

  def call(conn, {:error, error})
      when error in [:unprocessable_entity, :unauthorized, :forbidden, :not_found] do
    resp(conn, error, "")
  end

  def call(conn, _error) do
    resp(conn, :internal_server_error, "")
  end
end
