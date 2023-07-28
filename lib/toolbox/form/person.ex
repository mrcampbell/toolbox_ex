defmodule MC.Form.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :name, :string
    field :lucky_number, :integer
    field :birthday, :date

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :lucky_number, :birthday])
    |> validate_required([:name, :lucky_number, :birthday])
  end
end
