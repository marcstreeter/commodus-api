defmodule ApiWeb.TextoController do
  use ApiWeb, :controller

  alias Api.Mensaje
  alias Api.Mensaje.Texto

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    textos = Mensaje.list_textos()
    render(conn, "index.json", textos: textos)
  end

  def create(conn, %{"texto" => texto_params}) do
    with {:ok, %Texto{} = texto} <- Mensaje.create_texto(texto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", texto_path(conn, :show, texto))
      |> render("show.json", texto: texto)
    end
  end

  def show(conn, %{"id" => id}) do
    texto = Mensaje.get_texto!(id)
    render(conn, "show.json", texto: texto)
  end

  def update(conn, %{"id" => id, "texto" => texto_params}) do
    texto = Mensaje.get_texto!(id)

    with {:ok, %Texto{} = texto} <- Mensaje.update_texto(texto, texto_params) do
      render(conn, "show.json", texto: texto)
    end
  end

  def delete(conn, %{"id" => id}) do
    texto = Mensaje.get_texto!(id)
    with {:ok, %Texto{}} <- Mensaje.delete_texto(texto) do
      send_resp(conn, :no_content, "")
    end
  end
end
