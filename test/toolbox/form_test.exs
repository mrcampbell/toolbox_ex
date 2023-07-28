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
end
