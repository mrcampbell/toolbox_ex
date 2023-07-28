defmodule MC.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do

    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:pets) do
      add :name, :string
      add :fur_color, :string
      add :person_id, references(:persons, on_delete: :delete_all)

      timestamps()
    end

    create index(:pets, [:name])
    create unique_index(:pets, [:name, :person_id])
  end
end
