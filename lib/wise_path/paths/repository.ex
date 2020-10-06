defmodule WisePath.Paths.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "repositories" do
    field(:link, :string)
    field(:notes, :string)
    field(:title, :string)

    belongs_to(:path, WisePath.Paths.Path)

    timestamps()
  end

  @doc false
  def changeset(repository, attrs) do
    repository
    |> cast(attrs, [:title, :notes, :link])
    |> validate_required([:title, :notes, :link])
  end
end
