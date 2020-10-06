defmodule WisePathWeb.Api.PathView do
  use WisePathWeb, :view

  def render("index.json", %{data: paths}) do
    %{data: Enum.map(paths, &item/1)}
  end

  def render("show.json", %{data: path}), do: %{data: item_with_repositories(path)}

  def render("item.json", %{data: path}), do: %{data: item(path)}

  def item(path) do
    %{
      id: path.id,
      title: path.title,
      description: path.description,
      inserted_at: path.inserted_at,
      updated_at: path.updated_at
    }
  end

  def item_with_repositories(path) do
    Map.merge(item(path), %{
      repositories: Enum.map(path.repositories, &WisePathWeb.Api.RepositoryView.repository/1)
    })
  end
end
