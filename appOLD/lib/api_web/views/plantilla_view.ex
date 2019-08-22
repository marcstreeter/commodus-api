defmodule ApiWeb.PlantillaView do
  use ApiWeb, :view
  alias ApiWeb.PlantillaView

  def render("index.json", %{plantillas: plantillas}) do
    %{data: render_many(plantillas, PlantillaView, "plantilla.json")}
  end

  def render("show.json", %{plantilla: plantilla}) do
    %{data: render_one(plantilla, PlantillaView, "plantilla.json")}
  end

  def render("plantilla.json", %{plantilla: plantilla}) do
    %{id: plantilla.id,
      tema: plantilla.tema,
      contenido: plantilla.contenido,
      creado: plantilla.creado}
  end
end
