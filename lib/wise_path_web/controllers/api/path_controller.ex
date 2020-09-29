defmodule WisePathWeb.Api.PathController do
  use WisePathWeb, :controller

  alias WisePath.Repo
  alias WisePath.Path

  def index(conn, _params) do
    paths = Repo.all(Path)

    render(conn, "index.json", %{data: paths})
  end
end
