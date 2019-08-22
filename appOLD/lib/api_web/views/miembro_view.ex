defmodule ApiWeb.MiembroView do
  use ApiWeb, :view
  alias ApiWeb.MiembroView

  def render("index.json", %{miembros: miembros}) do
    %{data: render_many(miembros, MiembroView, "miembro.json")}
  end

  def render("show.json", %{miembro: miembro}) do
    %{data: render_one(miembro, MiembroView, "miembro.json")}
  end

  def render("miembro.json", %{miembro: miembro}) do
    %{id: miembro.id,
      apellido: miembro.apellido,
      telefono: miembro.telefono}
  end
end
