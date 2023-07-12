defmodule MC.Game.Breed do
  use Ecto.Schema
  import Ecto.Changeset

  @elements [
    "fire",
    "water",
    "grass",
    "electric",
    "ice",
    "fighting",
    "poison",
    "ground",
    "flying",
    "psychic",
    "bug",
    "rock",
    "ghost",
    "dark",
    "dragon",
    "steel",
    "fairy"
  ]

  schema "breed" do
    field(:element_one, :string)
    field(:element_two, :string)
    field(:image_id, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(breed, attrs) do
    breed
    |> cast(attrs, [:name, :element_one, :element_two, :image_id])
    |> validate_required([:name, :element_one, :image_id])
    |> validate_length(:name, min: 1, max: 20)
    |> validate_inclusion(:element_one, @elements)
    |> validate_inclusion(:element_two, @elements ++ ["none"])
  end
end
