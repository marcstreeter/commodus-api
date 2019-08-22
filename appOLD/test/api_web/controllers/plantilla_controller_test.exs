defmodule ApiWeb.PlantillaControllerTest do
  use ApiWeb.ConnCase

  alias Api.Campana
  alias Api.Campana.Plantilla

  @create_attrs %{contenido: "some contenido", creado: ~N[2010-04-17 14:00:00.000000], tema: "some tema"}
  @update_attrs %{contenido: "some updated contenido", creado: ~N[2011-05-18 15:01:01.000000], tema: "some updated tema"}
  @invalid_attrs %{contenido: nil, creado: nil, tema: nil}

  def fixture(:plantilla) do
    {:ok, plantilla} = Campana.create_plantilla(@create_attrs)
    plantilla
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all plantillas", %{conn: conn} do
      conn = get conn, plantilla_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create plantilla" do
    test "renders plantilla when data is valid", %{conn: conn} do
      conn = post conn, plantilla_path(conn, :create), plantilla: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, plantilla_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "contenido" => "some contenido",
        "creado" => ~N[2010-04-17 14:00:00.000000],
        "tema" => "some tema"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, plantilla_path(conn, :create), plantilla: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update plantilla" do
    setup [:create_plantilla]

    test "renders plantilla when data is valid", %{conn: conn, plantilla: %Plantilla{id: id} = plantilla} do
      conn = put conn, plantilla_path(conn, :update, plantilla), plantilla: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, plantilla_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "contenido" => "some updated contenido",
        "creado" => ~N[2011-05-18 15:01:01.000000],
        "tema" => "some updated tema"}
    end

    test "renders errors when data is invalid", %{conn: conn, plantilla: plantilla} do
      conn = put conn, plantilla_path(conn, :update, plantilla), plantilla: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete plantilla" do
    setup [:create_plantilla]

    test "deletes chosen plantilla", %{conn: conn, plantilla: plantilla} do
      conn = delete conn, plantilla_path(conn, :delete, plantilla)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, plantilla_path(conn, :show, plantilla)
      end
    end
  end

  defp create_plantilla(_) do
    plantilla = fixture(:plantilla)
    {:ok, plantilla: plantilla}
  end
end
