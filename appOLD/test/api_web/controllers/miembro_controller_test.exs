defmodule ApiWeb.MiembroControllerTest do
  use ApiWeb.ConnCase

  alias Api.Contacto
  alias Api.Contacto.Miembro

  @create_attrs %{apellido: "some apellido", telefono: "some telefono"}
  @update_attrs %{apellido: "some updated apellido", telefono: "some updated telefono"}
  @invalid_attrs %{apellido: nil, telefono: nil}

  def fixture(:miembro) do
    {:ok, miembro} = Contacto.create_miembro(@create_attrs)
    miembro
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all miembros", %{conn: conn} do
      conn = get conn, miembro_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create miembro" do
    test "renders miembro when data is valid", %{conn: conn} do
      conn = post conn, miembro_path(conn, :create), miembro: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, miembro_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "apellido" => "some apellido",
        "telefono" => "some telefono"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, miembro_path(conn, :create), miembro: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update miembro" do
    setup [:create_miembro]

    test "renders miembro when data is valid", %{conn: conn, miembro: %Miembro{id: id} = miembro} do
      conn = put conn, miembro_path(conn, :update, miembro), miembro: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, miembro_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "apellido" => "some updated apellido",
        "telefono" => "some updated telefono"}
    end

    test "renders errors when data is invalid", %{conn: conn, miembro: miembro} do
      conn = put conn, miembro_path(conn, :update, miembro), miembro: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete miembro" do
    setup [:create_miembro]

    test "deletes chosen miembro", %{conn: conn, miembro: miembro} do
      conn = delete conn, miembro_path(conn, :delete, miembro)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, miembro_path(conn, :show, miembro)
      end
    end
  end

  defp create_miembro(_) do
    miembro = fixture(:miembro)
    {:ok, miembro: miembro}
  end
end
