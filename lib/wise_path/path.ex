defmodule WisePath.Path do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "paths" do
    field(:description, :string)
    field(:title, :string)

    timestamps()
  end

  @doc false
  def changeset(path, attrs) do
    path
    |> cast(attrs, [:title, :descrition])
    |> validate_required([:title])
  end
end
