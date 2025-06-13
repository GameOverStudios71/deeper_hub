defmodule DeeperHub.Core.Data.Connection do
  @moduledoc """
  Módulo para conexão com banco de dados SQLite usando o Repo existente.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Executa uma query SQL no banco SQLite.
  """
  def query(sql, params \\ []) do
    case Repo.query(sql, params) do
      {:ok, rows} ->
        {:ok, %{
          rows: rows,
          num_rows: length(rows)
        }}
      {:error, error} ->
        {:error, error}
    end
  end

end
