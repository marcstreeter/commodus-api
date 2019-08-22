defmodule Api.Contacto do
  @moduledoc """
  The Contacto context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Contacto.Miembro

  @doc """
  Returns the list of miembros.

  ## Examples

      iex> list_miembros()
      [%Miembro{}, ...]

  """
  def list_miembros do
    Repo.all(Miembro)
  end

  @doc """
  Gets a single miembro.

  Raises `Ecto.NoResultsError` if the Miembro does not exist.

  ## Examples

      iex> get_miembro!(123)
      %Miembro{}

      iex> get_miembro!(456)
      ** (Ecto.NoResultsError)

  """
  def get_miembro!(id), do: Repo.get!(Miembro, id)

  @doc """
  Creates a miembro.

  ## Examples

      iex> create_miembro(%{field: value})
      {:ok, %Miembro{}}

      iex> create_miembro(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_miembro(attrs \\ %{}) do
    %Miembro{}
    |> Miembro.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a miembro.

  ## Examples

      iex> update_miembro(miembro, %{field: new_value})
      {:ok, %Miembro{}}

      iex> update_miembro(miembro, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_miembro(%Miembro{} = miembro, attrs) do
    miembro
    |> Miembro.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Miembro.

  ## Examples

      iex> delete_miembro(miembro)
      {:ok, %Miembro{}}

      iex> delete_miembro(miembro)
      {:error, %Ecto.Changeset{}}

  """
  def delete_miembro(%Miembro{} = miembro) do
    Repo.delete(miembro)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking miembro changes.

  ## Examples

      iex> change_miembro(miembro)
      %Ecto.Changeset{source: %Miembro{}}

  """
  def change_miembro(%Miembro{} = miembro) do
    Miembro.changeset(miembro, %{})
  end
end
