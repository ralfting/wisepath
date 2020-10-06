defmodule WisePath.Paths.Path do
  use Ecto.Schema
  import Ecto.Changeset

  alias WisePath.Paths.Repository

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "paths" do
    field(:description, :string)
    field(:title, :string)

    has_many(:repositories, Repository)

    timestamps()
  end

  @doc false
  def changeset(target \\ %__MODULE__{}, attrs) do
    target
    |> cast(attrs, [:title, :description])
    |> validate_required([:title])
  end
end
