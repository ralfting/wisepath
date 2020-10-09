defmodule WisePathWeb.Api.FallbackController do
  use WisePathWeb, :controller

  @status_errors [:unprocessable_entity, :unauthorized, :forbidden, :not_found]

  def call(conn, {:error, error})
      when error in @status_errors do
    resp(conn, error, "")
  end

  def call(conn, _error) do
    resp(conn, :internal_server_error, "")
  end
end
