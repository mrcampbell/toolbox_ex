defmodule MC.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string
      add :lucky_number, :integer
      add :birthday, :date

      timestamps()
    end
  end
end
