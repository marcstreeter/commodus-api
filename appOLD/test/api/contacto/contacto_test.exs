defmodule Api.ContactoTest do
  use Api.DataCase

  alias Api.Contacto

  describe "miembros" do
    alias Api.Contacto.Miembro

    @valid_attrs %{apellido: "some apellido", telefono: "some telefono"}
    @update_attrs %{apellido: "some updated apellido", telefono: "some updated telefono"}
    @invalid_attrs %{apellido: nil, telefono: nil}

    def miembro_fixture(attrs \\ %{}) do
      {:ok, miembro} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacto.create_miembro()

      miembro
    end

    test "list_miembros/0 returns all miembros" do
      miembro = miembro_fixture()
      assert Contacto.list_miembros() == [miembro]
    end

    test "get_miembro!/1 returns the miembro with given id" do
      miembro = miembro_fixture()
      assert Contacto.get_miembro!(miembro.id) == miembro
    end

    test "create_miembro/1 with valid data creates a miembro" do
      assert {:ok, %Miembro{} = miembro} = Contacto.create_miembro(@valid_attrs)
      assert miembro.apellido == "some apellido"
      assert miembro.telefono == "some telefono"
    end

    test "create_miembro/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacto.create_miembro(@invalid_attrs)
    end

    test "update_miembro/2 with valid data updates the miembro" do
      miembro = miembro_fixture()
      assert {:ok, miembro} = Contacto.update_miembro(miembro, @update_attrs)
      assert %Miembro{} = miembro
      assert miembro.apellido == "some updated apellido"
      assert miembro.telefono == "some updated telefono"
    end

    test "update_miembro/2 with invalid data returns error changeset" do
      miembro = miembro_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacto.update_miembro(miembro, @invalid_attrs)
      assert miembro == Contacto.get_miembro!(miembro.id)
    end

    test "delete_miembro/1 deletes the miembro" do
      miembro = miembro_fixture()
      assert {:ok, %Miembro{}} = Contacto.delete_miembro(miembro)
      assert_raise Ecto.NoResultsError, fn -> Contacto.get_miembro!(miembro.id) end
    end

    test "change_miembro/1 returns a miembro changeset" do
      miembro = miembro_fixture()
      assert %Ecto.Changeset{} = Contacto.change_miembro(miembro)
    end
  end
end
