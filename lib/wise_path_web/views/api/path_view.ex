defmodule WisePathWeb.Api.PathView do
  use WisePathWeb, :view

  def render("index.json", %{data: paths}) do
    %{data: Enum.map(paths, &item/1)}
  end

  def item(path) do
    %{
      id: path.id,
      title: path.title,
      description: path.description,
      inserted_at: path.inserted_at,
      updated_at: path.updated_at
    }
  end
end
