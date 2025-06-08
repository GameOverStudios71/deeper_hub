defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsEmbedsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_embeds.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_embeds_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_objects_embeds já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_embeds...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [1, "sys_system", "System", "BxTemplEmbedSystem", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [2, "sys_embedly", "Embedly", "BxTemplEmbedEmbedly", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [3, "sys_iframely", "Iframely", "BxTemplEmbedIframely", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [4, "sys_oembed", "Oembed", "BxTemplEmbedOembed", ""])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_objects_embeds executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_objects_embeds: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_embeds...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_embeds...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_embeds")
    Logger.info("Tabela sys_objects_embeds limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
