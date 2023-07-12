defmodule MC.GameTest do
  use MC.DataCase

  alias MC.Game

  describe "id" do
    alias MC.Game.Breed

    import MC.GameFixtures

    @invalid_attrs %{element_one: nil, element_two: nil, image_id: nil, name: nil}

    test "list_id/0 returns all id" do
      breed = breed_fixture()
      assert Game.list_id() == [breed]
    end

    test "get_breed!/1 returns the breed with given id" do
      breed = breed_fixture()
      assert Game.get_breed!(breed.id) == breed
    end

    test "create_breed/1 with valid data creates a breed" do
      valid_attrs = %{
        element_one: "some element_one",
        element_two: "some element_two",
        image_id: "some image_id",
        name: "some name"
      }

      assert {:ok, %Breed{} = breed} = Game.create_breed(valid_attrs)
      assert breed.element_one == "some element_one"
      assert breed.element_two == "some element_two"
      assert breed.image_id == "some image_id"
      assert breed.name == "some name"
    end

    test "create_breed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_breed(@invalid_attrs)
    end

    test "update_breed/2 with valid data updates the breed" do
      breed = breed_fixture()

      update_attrs = %{
        element_one: "some updated element_one",
        element_two: "some updated element_two",
        image_id: "some updated image_id",
        name: "some updated name"
      }

      assert {:ok, %Breed{} = breed} = Game.update_breed(breed, update_attrs)
      assert breed.element_one == "some updated element_one"
      assert breed.element_two == "some updated element_two"
      assert breed.image_id == "some updated image_id"
      assert breed.name == "some updated name"
    end

    test "update_breed/2 with invalid data returns error changeset" do
      breed = breed_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_breed(breed, @invalid_attrs)
      assert breed == Game.get_breed!(breed.id)
    end

    test "delete_breed/1 deletes the breed" do
      breed = breed_fixture()
      assert {:ok, %Breed{}} = Game.delete_breed(breed)
      assert_raise Ecto.NoResultsError, fn -> Game.get_breed!(breed.id) end
    end

    test "change_breed/1 returns a breed changeset" do
      breed = breed_fixture()
      assert %Ecto.Changeset{} = Game.change_breed(breed)
    end
  end
end
