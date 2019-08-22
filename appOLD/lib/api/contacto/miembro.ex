defmodule Api.Contacto.Miembro do
  use Ecto.Schema
  import Ecto.Changeset


  schema "miembros" do
    field :apellido, :string
    field :telefono, :string

    timestamps()
  end

  @doc false
  def changeset(miembro, attrs) do
    miembro
    |> cast(attrs, [:apellido, :telefono])
    |> validate_required([:apellido, :telefono])
  end
end
