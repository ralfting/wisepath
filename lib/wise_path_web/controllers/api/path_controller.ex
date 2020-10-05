defmodule WisePathWeb.Api.PathController do
  use WisePathWeb, :controller

  alias WisePath.Paths

  def index(conn, _params) do
    paths = Paths.fetch_all()

    conn
    |> put_status(:ok)
    |> render("index.json", %{data: paths})
  end

  def create(conn, params) do
    with {:ok, path} <- Paths.create(params) do
      conn
      |> put_status(:created)
      |> render("show.json", data: path)
    end
  end

  def update(conn, params) do
    with {:ok, path} = Paths.update(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", data: path)
    end
  end

  def delete(conn, params) do
    with {:ok, path} = Paths.delete(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", data: path)
    end
  end
end
