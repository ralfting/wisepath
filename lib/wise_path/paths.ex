defmodule WisePath.Paths do
  alias WisePath.Repo
  alias WisePath.Paths.Path

  def fetch_all() do
    Path
    |> Repo.all()
  end

  def fetch(id) do
    Path
    |> Repo.get(id)
    |> Repo.preload([:repositories])
    |> as_result()
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
    |> Repo.update()
  end

  def delete(path) do
    path
    |> Repo.delete()
  end

  defp as_result(%Path{} = path), do: {:ok, path}

  defp as_result(nil), do: {:error, :not_found}
end
