defmodule MC.Repo.Migrations.AddPersonalityAndPersonId do
  use Ecto.Migration

  def change do

    alter table(:persons) do
      add :personality, :map
    end
  end
end
