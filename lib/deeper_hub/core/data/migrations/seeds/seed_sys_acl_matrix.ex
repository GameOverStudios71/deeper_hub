defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAclMatrixSeed do
  @moduledoc """
  Seed para a tabela sys_acl_matrix.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_acl_matrix_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_acl_matrix já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_acl_matrix...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 1, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 1, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 1, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 1, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 2, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 2, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 2, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 2, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 3, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 4, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 4, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 4, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 4, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 5, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 5, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 5, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 5, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 6, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 6, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 7, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 7, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 7, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 7, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 8, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 9, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 9, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 10, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 11, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 11, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 12, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 12, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 12, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 12, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 13, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 13, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 13, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 13, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 14, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 14, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 14, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 14, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 15, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 15, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 16, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 16, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 17, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 17, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 18, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 18, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 19, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 19, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 20, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 21, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 21, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 21, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 21, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 21, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 21, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 21, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 22, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 23, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 24, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 25, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 25, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 25, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 25, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 25, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 25, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 25, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 26, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 27, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 27, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 27, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 27, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 28, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 28, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 29, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 30, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 31, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 31, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 39, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 39, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 39, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 39, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 39, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 39, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 39, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 40, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 40, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 40, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 40, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 40, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 40, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 40, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 41, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 42, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 42, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 43, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 44, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 44, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 45, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 46, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 46, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [6, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 47, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 48, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 48, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 48, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 48, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 49, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 49, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 49, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 49, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 50, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 50, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 50, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 50, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 51, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 51, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 51, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 51, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 51, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [7, 51, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [8, 51, nil, nil, nil, nil, nil])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_matrix (IDLevel, IDAction, AllowedCount, AllowedPeriodLen, AllowedPeriodStart, AllowedPeriodEnd, AdditionalParamValue) VALUES (?, ?, ?, ?, ?, ?, ?)", [9, 51, nil, nil, nil, nil, nil])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_acl_matrix executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_acl_matrix: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_acl_matrix...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_acl_matrix será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_acl_matrix...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_acl_matrix")
    Logger.info("Tabela sys_acl_matrix limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
