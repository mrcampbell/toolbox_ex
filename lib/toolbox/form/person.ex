defmodule MC.Form.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :name, :string
    field :lucky_number, :integer
    field :birthday, :date

    has_many :pets, MC.Form.Pet

    embeds_one :personality, MC.Form.Personality, on_replace: :delete do
      field :favorite_color, :string
      field :favorite_food, :string
      field :in_three_words, :string
    end

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :lucky_number, :birthday])
    |> validate_required([:name, :lucky_number, :birthday])
    |> validate_number(:lucky_number, greater_than: 0)
  end
end
