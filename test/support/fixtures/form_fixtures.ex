defmodule MC.FormFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MC.Form` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        name: "some name",
        lucky_number: 42,
        birthday: ~D[2023-07-27]
      })
      |> MC.Form.create_person()

    person
  end
end
