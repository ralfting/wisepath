defmodule WisePath.Repo.Migrations.AddPathIdInRepositories do
  use Ecto.Migration

  def change do
    alter table("repositories") do
      add(:path_id, references("paths", type: :binary_id))
    end
  end
end
