defmodule Api.Campana do
  @moduledoc """
  The Campana context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Campana.Plantilla

  @doc """
  Returns the list of plantillas.

  ## Examples

      iex> list_plantillas()
      [%Plantilla{}, ...]

  """
  def list_plantillas do
    Repo.all(Plantilla)
  end

  @doc """
  Gets a single plantilla.

  Raises `Ecto.NoResultsError` if the Plantilla does not exist.

  ## Examples

      iex> get_plantilla!(123)
      %Plantilla{}

      iex> get_plantilla!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plantilla!(id), do: Repo.get!(Plantilla, id)

  @doc """
  Creates a plantilla.

  ## Examples

      iex> create_plantilla(%{field: value})
      {:ok, %Plantilla{}}

      iex> create_plantilla(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plantilla(attrs \\ %{}) do
    %Plantilla{}
    |> Plantilla.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plantilla.

  ## Examples

      iex> update_plantilla(plantilla, %{field: new_value})
      {:ok, %Plantilla{}}

      iex> update_plantilla(plantilla, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plantilla(%Plantilla{} = plantilla, attrs) do
    plantilla
    |> Plantilla.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Plantilla.

  ## Examples

      iex> delete_plantilla(plantilla)
      {:ok, %Plantilla{}}

      iex> delete_plantilla(plantilla)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plantilla(%Plantilla{} = plantilla) do
    Repo.delete(plantilla)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plantilla changes.

  ## Examples

      iex> change_plantilla(plantilla)
      %Ecto.Changeset{source: %Plantilla{}}

  """
  def change_plantilla(%Plantilla{} = plantilla) do
    Plantilla.changeset(plantilla, %{})
  end
end
