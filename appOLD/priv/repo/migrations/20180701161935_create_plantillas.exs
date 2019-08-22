defmodule Api.Repo.Migrations.CreatePlantillas do
  use Ecto.Migration

  def change do
    create table(:plantillas) do
      add :lds, :string
      add :tema, :string
      add :contenido, :string
      add :creado, :naive_datetime

      timestamps()
    end

  end
end
