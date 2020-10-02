defmodule WisePathWeb.Api.PathController do
  use WisePathWeb, :controller

  alias WisePath.Repo
  alias WisePath.Path

  def index(conn, _params) do
    paths = Repo.all(Path)

    render(conn, "index.json", %{data: paths})
  end

  def create(conn, params) do
    with {:ok, path} <-
           params
           |> WisePath.Path.changeset()
           |> Repo.insert() do
      render(conn, "show.json", data: path)
    end
  end
end
