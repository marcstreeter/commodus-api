defmodule Api.Mensaje do
  @moduledoc """
  The Mensaje context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Mensaje.Texto

  @doc """
  Returns the list of textos.

  ## Examples

      iex> list_textos()
      [%Texto{}, ...]

  """
  def list_textos do
    Repo.all(Texto)
  end

  @doc """
  Gets a single texto.

  Raises `Ecto.NoResultsError` if the Texto does not exist.

  ## Examples

      iex> get_texto!(123)
      %Texto{}

      iex> get_texto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_texto!(id), do: Repo.get!(Texto, id)

  @doc """
  Creates a texto.

  ## Examples

      iex> create_texto(%{field: value})
      {:ok, %Texto{}}

      iex> create_texto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_texto(attrs \\ %{}) do
    %Texto{}
    |> Texto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a texto.

  ## Examples

      iex> update_texto(texto, %{field: new_value})
      {:ok, %Texto{}}

      iex> update_texto(texto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_texto(%Texto{} = texto, attrs) do
    texto
    |> Texto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Texto.

  ## Examples

      iex> delete_texto(texto)
      {:ok, %Texto{}}

      iex> delete_texto(texto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_texto(%Texto{} = texto) do
    Repo.delete(texto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking texto changes.

  ## Examples

      iex> change_texto(texto)
      %Ecto.Changeset{source: %Texto{}}

  """
  def change_texto(%Texto{} = texto) do
    Texto.changeset(texto, %{})
  end
end
