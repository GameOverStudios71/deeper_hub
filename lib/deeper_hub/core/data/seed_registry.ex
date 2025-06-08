defmodule DeeperHub.Core.Data.SeedRegistry do
  @moduledoc """
  Módulo responsável por gerenciar o registro de seeds executados.
  Controla quais seeds já foram executados para evitar re-execução.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Verifica se um seed já foi executado com sucesso.
  """
  @spec seed_executed?(String.t()) :: boolean()
  def seed_executed?(seed_name) do
    ensure_registry_table()

    sql = "SELECT COUNT(*) FROM sys_seed_registry WHERE seed_name = ? AND status = 'success'"

    case Repo.execute(sql, [seed_name]) do
      {:ok, %{rows: [[count]]}} when count > 0 -> true
      {:ok, %{rows: []}} -> false
      _ -> false
    end
  end

  @doc """
  Marca um seed como executado com sucesso.
  """
  @spec mark_seed_executed(String.t()) :: :ok | {:error, any()}
  def mark_seed_executed(seed_name) do
    ensure_registry_table()

    executed_at = DateTime.utc_now() |> DateTime.to_iso8601()

    sql = """
    INSERT OR REPLACE INTO sys_seed_registry (seed_name, executed_at, status)
    VALUES (?, ?, 'success')
    """

    case Repo.execute(sql, [seed_name, executed_at]) do
      {:ok, _result} ->
        Logger.info("Seed '#{seed_name}' marcado como executado.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao marcar seed '#{seed_name}' como executado: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Marca um seed como falhado.
  """
  @spec mark_seed_failed(String.t(), String.t()) :: :ok | {:error, any()}
  def mark_seed_failed(seed_name, error_message) do
    ensure_registry_table()

    executed_at = DateTime.utc_now() |> DateTime.to_iso8601()

    sql = """
    INSERT OR REPLACE INTO sys_seed_registry (seed_name, executed_at, status, error_message)
    VALUES (?, ?, 'failed', ?)
    """

    case Repo.execute(sql, [seed_name, executed_at, error_message]) do
      {:ok, _result} ->
        Logger.warning("Seed '#{seed_name}' marcado como falhado.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao marcar seed '#{seed_name}' como falhado: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Lista todos os seeds executados.
  """
  @spec list_executed_seeds() :: list()
  def list_executed_seeds do
    ensure_registry_table()

    sql = "SELECT seed_name, executed_at, status FROM sys_seed_registry ORDER BY executed_at DESC"

    case Repo.execute(sql) do
      {:ok, %{rows: rows}} ->
        Enum.map(rows, fn [name, executed_at, status] ->
          %{seed_name: name, executed_at: executed_at, status: status}
        end)
      {:error, _} -> []
    end
  end

  @doc """
  Remove o registro de um seed (força re-execução).
  """
  @spec reset_seed(String.t()) :: :ok | {:error, any()}
  def reset_seed(seed_name) do
    ensure_registry_table()

    sql = "DELETE FROM sys_seed_registry WHERE seed_name = ?"

    case Repo.execute(sql, [seed_name]) do
      {:ok, _result} ->
        Logger.info("Registro do seed '#{seed_name}' removido. Será re-executado na próxima inicialização.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao remover registro do seed '#{seed_name}': #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Limpa todos os registros de seeds (força re-execução de todos).
  """
  @spec reset_all_seeds() :: :ok | {:error, any()}
  def reset_all_seeds do
    ensure_registry_table()

    sql = "DELETE FROM sys_seed_registry"

    case Repo.execute(sql) do
      {:ok, _result} ->
        Logger.info("Todos os registros de seeds removidos. Todos serão re-executados na próxima inicialização.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao limpar registros de seeds: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc false
  defp ensure_registry_table do
    # Garante que a tabela existe (caso a migration não tenha sido executada)
    sql = """
    CREATE TABLE IF NOT EXISTS sys_seed_registry (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      seed_name TEXT NOT NULL UNIQUE,
      executed_at TEXT NOT NULL,
      status TEXT NOT NULL DEFAULT 'success',
      error_message TEXT,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    )
    """
    
    Repo.execute(sql)
  end
end
