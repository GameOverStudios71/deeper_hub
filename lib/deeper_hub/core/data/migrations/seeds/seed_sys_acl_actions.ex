defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAclActionsSeed do
  @moduledoc """
  Seed para a tabela sys_acl_actions.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_acl_actions...")

    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [1, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [2, nil, 1, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [3, nil, 1, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [4, nil, 1, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [5, nil, 1, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [6, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [7, nil, 1, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [8, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [9, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [10, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [11, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [12, nil, 1, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [13, nil, 0, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [14, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [15, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [16, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [17, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [18, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [19, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [20, nil, 0, 2147483646])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [21, nil, 0, 1])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [22, nil, 0, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [23, nil, 0, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [24, nil, 0, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [25, nil, 0, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [26, nil, 0, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [27, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [28, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [29, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [30, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [31, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [32, nil, 0, 1])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [33, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [34, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [35, nil, 0, 1])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [36, nil, 0, 1])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [37, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [38, nil, 0, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [39, nil, 1, 1])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [40, nil, 1, 1])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [41, nil, 1, 0])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [42, nil, 1, 3])
    Repo.execute("INSERT INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, Desc, Countable, DisabledForLevels) VALUES (?, ?, ?, ?)", [43, nil, 1, 3])

    IO.puts("Registros inseridos com sucesso!")
  end
end
