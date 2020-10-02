defmodule WisePathWeb.Factory do
  use ExMachina.Ecto, repo: WisePath.Repo

  alias WisePath.Paths.Path

  def path_factory do
    %Path{
      title: sequence(:title, &"Title #{&1}"),
      description: sequence(:description, &"Description #{&1}")
    }
  end
end
