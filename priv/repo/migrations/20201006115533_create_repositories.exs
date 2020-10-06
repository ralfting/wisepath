defmodule WisePath.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :notes, :text
      add :link, :string

      timestamps()
    end

  end
end
