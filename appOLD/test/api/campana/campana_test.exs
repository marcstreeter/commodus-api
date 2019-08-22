defmodule Api.CampanaTest do
  use Api.DataCase

  alias Api.Campana

  describe "plantillas" do
    alias Api.Campana.Plantilla

    @valid_attrs %{contenido: "some contenido", creado: ~N[2010-04-17 14:00:00.000000], lds: "some lds", tema: "some tema"}
    @update_attrs %{contenido: "some updated contenido", creado: ~N[2011-05-18 15:01:01.000000], lds: "some updated lds", tema: "some updated tema"}
    @invalid_attrs %{contenido: nil, creado: nil, lds: nil, tema: nil}

    def plantilla_fixture(attrs \\ %{}) do
      {:ok, plantilla} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Campana.create_plantilla()

      plantilla
    end

    test "list_plantillas/0 returns all plantillas" do
      plantilla = plantilla_fixture()
      assert Campana.list_plantillas() == [plantilla]
    end

    test "get_plantilla!/1 returns the plantilla with given id" do
      plantilla = plantilla_fixture()
      assert Campana.get_plantilla!(plantilla.id) == plantilla
    end

    test "create_plantilla/1 with valid data creates a plantilla" do
      assert {:ok, %Plantilla{} = plantilla} = Campana.create_plantilla(@valid_attrs)
      assert plantilla.contenido == "some contenido"
      assert plantilla.creado == ~N[2010-04-17 14:00:00.000000]
      assert plantilla.lds == "some lds"
      assert plantilla.tema == "some tema"
    end

    test "create_plantilla/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Campana.create_plantilla(@invalid_attrs)
    end

    test "update_plantilla/2 with valid data updates the plantilla" do
      plantilla = plantilla_fixture()
      assert {:ok, plantilla} = Campana.update_plantilla(plantilla, @update_attrs)
      assert %Plantilla{} = plantilla
      assert plantilla.contenido == "some updated contenido"
      assert plantilla.creado == ~N[2011-05-18 15:01:01.000000]
      assert plantilla.lds == "some updated lds"
      assert plantilla.tema == "some updated tema"
    end

    test "update_plantilla/2 with invalid data returns error changeset" do
      plantilla = plantilla_fixture()
      assert {:error, %Ecto.Changeset{}} = Campana.update_plantilla(plantilla, @invalid_attrs)
      assert plantilla == Campana.get_plantilla!(plantilla.id)
    end

    test "delete_plantilla/1 deletes the plantilla" do
      plantilla = plantilla_fixture()
      assert {:ok, %Plantilla{}} = Campana.delete_plantilla(plantilla)
      assert_raise Ecto.NoResultsError, fn -> Campana.get_plantilla!(plantilla.id) end
    end

    test "change_plantilla/1 returns a plantilla changeset" do
      plantilla = plantilla_fixture()
      assert %Ecto.Changeset{} = Campana.change_plantilla(plantilla)
    end
  end

  describe "plantillas" do
    alias Api.Campana.Plantilla

    @valid_attrs %{contenido: "some contenido", creado: ~N[2010-04-17 14:00:00.000000], tema: "some tema"}
    @update_attrs %{contenido: "some updated contenido", creado: ~N[2011-05-18 15:01:01.000000], tema: "some updated tema"}
    @invalid_attrs %{contenido: nil, creado: nil, tema: nil}

    def plantilla_fixture(attrs \\ %{}) do
      {:ok, plantilla} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Campana.create_plantilla()

      plantilla
    end

    test "list_plantillas/0 returns all plantillas" do
      plantilla = plantilla_fixture()
      assert Campana.list_plantillas() == [plantilla]
    end

    test "get_plantilla!/1 returns the plantilla with given id" do
      plantilla = plantilla_fixture()
      assert Campana.get_plantilla!(plantilla.id) == plantilla
    end

    test "create_plantilla/1 with valid data creates a plantilla" do
      assert {:ok, %Plantilla{} = plantilla} = Campana.create_plantilla(@valid_attrs)
      assert plantilla.contenido == "some contenido"
      assert plantilla.creado == ~N[2010-04-17 14:00:00.000000]
      assert plantilla.tema == "some tema"
    end

    test "create_plantilla/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Campana.create_plantilla(@invalid_attrs)
    end

    test "update_plantilla/2 with valid data updates the plantilla" do
      plantilla = plantilla_fixture()
      assert {:ok, plantilla} = Campana.update_plantilla(plantilla, @update_attrs)
      assert %Plantilla{} = plantilla
      assert plantilla.contenido == "some updated contenido"
      assert plantilla.creado == ~N[2011-05-18 15:01:01.000000]
      assert plantilla.tema == "some updated tema"
    end

    test "update_plantilla/2 with invalid data returns error changeset" do
      plantilla = plantilla_fixture()
      assert {:error, %Ecto.Changeset{}} = Campana.update_plantilla(plantilla, @invalid_attrs)
      assert plantilla == Campana.get_plantilla!(plantilla.id)
    end

    test "delete_plantilla/1 deletes the plantilla" do
      plantilla = plantilla_fixture()
      assert {:ok, %Plantilla{}} = Campana.delete_plantilla(plantilla)
      assert_raise Ecto.NoResultsError, fn -> Campana.get_plantilla!(plantilla.id) end
    end

    test "change_plantilla/1 returns a plantilla changeset" do
      plantilla = plantilla_fixture()
      assert %Ecto.Changeset{} = Campana.change_plantilla(plantilla)
    end
  end
end
