defmodule MC.Form.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :name, :string
    field :fur_color, :string

    belongs_to :person, MC.Form.Person

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :fur_color, :person_id])
    |> validate_required([:name, :fur_color, :person_id])
  end
end
