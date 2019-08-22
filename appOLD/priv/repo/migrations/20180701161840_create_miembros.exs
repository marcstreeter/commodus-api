defmodule Api.Repo.Migrations.CreateMiembros do
  use Ecto.Migration

  def change do
    create table(:miembros) do
      add :apellido, :string
      add :telefono, :string

      timestamps()
    end

  end
end
