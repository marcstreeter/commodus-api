defmodule Api.Repo.Migrations.CreateTextos do
  use Ecto.Migration

  def change do
    create table(:textos) do
      add :remitente, :string
      add :receptor, :string
      add :contenido, :string
      add :created, :string

      timestamps()
    end

  end
end
