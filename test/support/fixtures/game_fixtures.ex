defmodule MC.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MC.Game` context.
  """

  @doc """
  Generate a breed.
  """
  def breed_fixture(attrs \\ %{}) do
    {:ok, breed} =
      attrs
      |> Enum.into(%{
        element_one: "some element_one",
        element_two: "some element_two",
        image_id: "some image_id",
        name: "some name"
      })
      |> MC.Game.create_breed()

    breed
  end
end
