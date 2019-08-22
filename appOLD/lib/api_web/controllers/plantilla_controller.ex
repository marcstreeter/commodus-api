defmodule ApiWeb.PlantillaController do
  use ApiWeb, :controller

  alias Api.Campana
  alias Api.Campana.Plantilla

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    plantillas = Campana.list_plantillas()
    render(conn, "index.json", plantillas: plantillas)
  end

  def create(conn, %{"plantilla" => plantilla_params}) do
    with {:ok, %Plantilla{} = plantilla} <- Campana.create_plantilla(plantilla_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", plantilla_path(conn, :show, plantilla))
      |> render("show.json", plantilla: plantilla)
    end
  end

  def show(conn, %{"id" => id}) do
    plantilla = Campana.get_plantilla!(id)
    render(conn, "show.json", plantilla: plantilla)
  end

  def update(conn, %{"id" => id, "plantilla" => plantilla_params}) do
    plantilla = Campana.get_plantilla!(id)

    with {:ok, %Plantilla{} = plantilla} <- Campana.update_plantilla(plantilla, plantilla_params) do
      render(conn, "show.json", plantilla: plantilla)
    end
  end

  def delete(conn, %{"id" => id}) do
    plantilla = Campana.get_plantilla!(id)
    with {:ok, %Plantilla{}} <- Campana.delete_plantilla(plantilla) do
      send_resp(conn, :no_content, "")
    end
  end
end
