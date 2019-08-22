defmodule Api.Campana.Plantilla do
  use Ecto.Schema
  import Ecto.Changeset


  schema "plantillas" do
    field :contenido, :string
    field :creado, :naive_datetime
    field :tema, :string

    timestamps()
  end

  @doc false
  def changeset(plantilla, attrs) do
    plantilla
    |> cast(attrs, [:tema, :contenido, :creado])
    |> validate_required([:tema, :contenido, :creado])
  end
end
