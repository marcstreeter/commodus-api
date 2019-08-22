defmodule Api.Mensaje.Texto do
  use Ecto.Schema
  import Ecto.Changeset


  schema "textos" do
    field :contenido, :string
    field :created, :string
    field :receptor, :string
    field :remitente, :string

    timestamps()
  end

  @doc false
  def changeset(texto, attrs) do
    texto
    |> cast(attrs, [:remitente, :receptor, :contenido, :created])
    |> validate_required([:remitente, :receptor, :contenido, :created])
  end
end
