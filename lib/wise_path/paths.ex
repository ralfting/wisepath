defmodule WisePath.Paths do
  alias WisePath.Repo
  alias WisePath.Paths.Path

  def fetch_all() do
    Path
    |> Repo.all()
  end

  def create(params) do
    params
    |> WisePath.Paths.Path.changeset()
    |> Repo.insert()
  end
end
