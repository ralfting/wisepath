defmodule WisePathWeb.Api.PathController do
  use WisePathWeb, :controller

  alias WisePath.Paths

  def index(conn, _params) do
    paths = Paths.fetch_all()

    conn
    |> put_status(:ok)
    |> render("index.json", %{data: paths})
  end

  def show(conn, params) do
    with {:ok, path} <- Paths.fetch(params["id"]) do
      render(conn, "show.json", data: path)
    end
  end

  def create(conn, params) do
    with {:ok, path} <- Paths.create(params) do
      conn
      |> put_status(:created)
      |> render("item.json", data: path)
    end
  end

  def update(conn, params) do
    with {:ok, path} <- Paths.update(params) do
      conn
      |> put_status(:ok)
      |> render("item.json", data: path)
    end
  end

  def delete(conn, params) do
    with {:ok, path_fetched} <- Paths.fetch(params["id"]),
         {:ok, _path} <- Paths.delete(path_fetched) do
      resp(conn, :no_content, "")
    end
  end
end
