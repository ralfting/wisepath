defmodule WisePathWeb.Factory do
  use ExMachina.Ecto, repo: WisePath.Repo

  alias WisePath.Paths.Path
  alias WisePath.Paths.Repository

  def path_factory do
    %Path{
      title: sequence(:title, &"Title #{&1}"),
      description: sequence(:description, &"Description #{&1}")
    }
  end

  def repository_factory do
    %Repository{
      title: sequence(:title, &"Title #{&1}"),
      notes: sequence(:notes, &"notes #{&1}"),
      link: "http://google.com",
      path: build(:path)
    }
  end
end
