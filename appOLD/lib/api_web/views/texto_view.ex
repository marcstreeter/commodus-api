defmodule ApiWeb.TextoView do
  use ApiWeb, :view
  alias ApiWeb.TextoView

  def render("index.json", %{textos: textos}) do
    %{data: render_many(textos, TextoView, "texto.json")}
  end

  def render("show.json", %{texto: texto}) do
    %{data: render_one(texto, TextoView, "texto.json")}
  end

  def render("texto.json", %{texto: texto}) do
    %{id: texto.id,
      remitente: texto.remitente,
      receptor: texto.receptor,
      contenido: texto.contenido,
      created: texto.created}
  end
end
