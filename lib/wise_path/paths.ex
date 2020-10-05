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

  def update(params) do
    Path
    |> Repo.get!(params["id"])
    |> Ecto.Changeset.cast(params["path"], [:title, :description])
    |> Repo.update!()
  end
end