defmodule Api.MensajeTest do
  use Api.DataCase

  alias Api.Mensaje

  describe "textos" do
    alias Api.Mensaje.Texto

    @valid_attrs %{contenido: "some contenido", created: "some created", receptor: "some receptor", remitente: "some remitente"}
    @update_attrs %{contenido: "some updated contenido", created: "some updated created", receptor: "some updated receptor", remitente: "some updated remitente"}
    @invalid_attrs %{contenido: nil, created: nil, receptor: nil, remitente: nil}

    def texto_fixture(attrs \\ %{}) do
      {:ok, texto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mensaje.create_texto()

      texto
    end

    test "list_textos/0 returns all textos" do
      texto = texto_fixture()
      assert Mensaje.list_textos() == [texto]
    end

    test "get_texto!/1 returns the texto with given id" do
      texto = texto_fixture()
      assert Mensaje.get_texto!(texto.id) == texto
    end

    test "create_texto/1 with valid data creates a texto" do
      assert {:ok, %Texto{} = texto} = Mensaje.create_texto(@valid_attrs)
      assert texto.contenido == "some contenido"
      assert texto.created == "some created"
      assert texto.receptor == "some receptor"
      assert texto.remitente == "some remitente"
    end

    test "create_texto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mensaje.create_texto(@invalid_attrs)
    end

    test "update_texto/2 with valid data updates the texto" do
      texto = texto_fixture()
      assert {:ok, texto} = Mensaje.update_texto(texto, @update_attrs)
      assert %Texto{} = texto
      assert texto.contenido == "some updated contenido"
      assert texto.created == "some updated created"
      assert texto.receptor == "some updated receptor"
      assert texto.remitente == "some updated remitente"
    end

    test "update_texto/2 with invalid data returns error changeset" do
      texto = texto_fixture()
      assert {:error, %Ecto.Changeset{}} = Mensaje.update_texto(texto, @invalid_attrs)
      assert texto == Mensaje.get_texto!(texto.id)
    end

    test "delete_texto/1 deletes the texto" do
      texto = texto_fixture()
      assert {:ok, %Texto{}} = Mensaje.delete_texto(texto)
      assert_raise Ecto.NoResultsError, fn -> Mensaje.get_texto!(texto.id) end
    end

    test "change_texto/1 returns a texto changeset" do
      texto = texto_fixture()
      assert %Ecto.Changeset{} = Mensaje.change_texto(texto)
    end
  end
end
