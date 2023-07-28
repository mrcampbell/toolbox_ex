defmodule MC.FormTest do
  use MC.DataCase

  alias MC.Form

  describe "persons" do
    alias MC.Form.Person

    import MC.FormFixtures

    @invalid_attrs %{name: nil, lucky_number: nil, birthday: nil}

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Form.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Form.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      valid_attrs = %{name: "some name", lucky_number: 42, birthday: ~D[2023-07-27]}

      assert {:ok, %Person{} = person} = Form.create_person(valid_attrs)
      assert person.name == "some name"
      assert person.lucky_number == 42
      assert person.birthday == ~D[2023-07-27]
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Form.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      update_attrs = %{name: "some updated name", lucky_number: 43, birthday: ~D[2023-07-28]}

      assert {:ok, %Person{} = person} = Form.update_person(person, update_attrs)
      assert person.name == "some updated name"
      assert person.lucky_number == 43
      assert person.birthday == ~D[2023-07-28]
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Form.update_person(person, @invalid_attrs)
      assert person == Form.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Form.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Form.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Form.change_person(person)
    end
  end

  describe "pets" do
    alias MC.Form.Pet

    import MC.FormFixtures

    @invalid_attrs %{name: nil, fur_color: nil}

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Form.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Form.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      valid_attrs = %{name: "some name", fur_color: "some fur_color"}

      assert {:ok, %Pet{} = pet} = Form.create_pet(valid_attrs)
      assert pet.name == "some name"
      assert pet.fur_color == "some fur_color"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Form.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      update_attrs = %{name: "some updated name", fur_color: "some updated fur_color"}

      assert {:ok, %Pet{} = pet} = Form.update_pet(pet, update_attrs)
      assert pet.name == "some updated name"
      assert pet.fur_color == "some updated fur_color"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Form.update_pet(pet, @invalid_attrs)
      assert pet == Form.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Form.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Form.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Form.change_pet(pet)
    end
  end
end
