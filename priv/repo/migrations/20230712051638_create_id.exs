defmodule MC.Repo.Migrations.CreateId do
  use Ecto.Migration

  def change do
    create table(:breed) do
      add :pokedex_id, :integer, null: false
      add :name, :string, null: false
      add :element_one, :string, null: false
      add :element_two, :string, default: "none"
      add :image_id, :text, null: false

      timestamps()
    end
  end
end
