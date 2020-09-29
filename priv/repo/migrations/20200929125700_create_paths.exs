defmodule WisePath.Repo.Migrations.CreatePaths do
  use Ecto.Migration

  def change do
    create table(:paths, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:title, :string)
      add(:description, :text)

      timestamps()
    end
  end
end
