defmodule ApiWeb.MiembroController do
  use ApiWeb, :controller

  alias Api.Contacto
  alias Api.Contacto.Miembro

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    miembros = Contacto.list_miembros()
    render(conn, "index.json", miembros: miembros)
  end

  def create(conn, %{"miembro" => miembro_params}) do
    with {:ok, %Miembro{} = miembro} <- Contacto.create_miembro(miembro_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", miembro_path(conn, :show, miembro))
      |> render("show.json", miembro: miembro)
    end
  end

  def show(conn, %{"id" => id}) do
    miembro = Contacto.get_miembro!(id)
    render(conn, "show.json", miembro: miembro)
  end

  def update(conn, %{"id" => id, "miembro" => miembro_params}) do
    miembro = Contacto.get_miembro!(id)

    with {:ok, %Miembro{} = miembro} <- Contacto.update_miembro(miembro, miembro_params) do
      render(conn, "show.json", miembro: miembro)
    end
  end

  def delete(conn, %{"id" => id}) do
    miembro = Contacto.get_miembro!(id)
    with {:ok, %Miembro{}} <- Contacto.delete_miembro(miembro) do
      send_resp(conn, :no_content, "")
    end
  end
end
