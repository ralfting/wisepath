defmodule WisePathWeb.Api.RepositoryView do
  use WisePathWeb, :view

  def repository(data) do
    %{
      title: data.title,
      notes: data.notes,
      link: data.link
    }
  end
end
