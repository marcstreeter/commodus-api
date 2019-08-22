defmodule ApiWeb.TextoControllerTest do
  use ApiWeb.ConnCase

  alias Api.Mensaje
  alias Api.Mensaje.Texto

  @create_attrs %{contenido: "some contenido", created: "some created", receptor: "some receptor", remitente: "some remitente"}
  @update_attrs %{contenido: "some updated contenido", created: "some updated created", receptor: "some updated receptor", remitente: "some updated remitente"}
  @invalid_attrs %{contenido: nil, created: nil, receptor: nil, remitente: nil}

  def fixture(:texto) do
    {:ok, texto} = Mensaje.create_texto(@create_attrs)
    texto
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all textos", %{conn: conn} do
      conn = get conn, texto_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create texto" do
    test "renders texto when data is valid", %{conn: conn} do
      conn = post conn, texto_path(conn, :create), texto: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, texto_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "contenido" => "some contenido",
        "created" => "some created",
        "receptor" => "some receptor",
        "remitente" => "some remitente"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, texto_path(conn, :create), texto: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update texto" do
    setup [:create_texto]

    test "renders texto when data is valid", %{conn: conn, texto: %Texto{id: id} = texto} do
      conn = put conn, texto_path(conn, :update, texto), texto: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, texto_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "contenido" => "some updated contenido",
        "created" => "some updated created",
        "receptor" => "some updated receptor",
        "remitente" => "some updated remitente"}
    end

    test "renders errors when data is invalid", %{conn: conn, texto: texto} do
      conn = put conn, texto_path(conn, :update, texto), texto: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete texto" do
    setup [:create_texto]

    test "deletes chosen texto", %{conn: conn, texto: texto} do
      conn = delete conn, texto_path(conn, :delete, texto)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, texto_path(conn, :show, texto)
      end
    end
  end

  defp create_texto(_) do
    texto = fixture(:texto)
    {:ok, texto: texto}
  end
end
