defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdWidgetsSeed do
  @moduledoc """
  Seed para a tabela sys_std_widgets.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_widgets...")

    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [1, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [2, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [3, 1])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [4, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [5, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [6, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [7, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [8, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [9, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [10, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [11, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [12, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [13, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [14, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [15, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [16, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [17, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [18, 0])
    Repo.execute("INSERT INTO sys_std_widgets (id, page_id, module, type, url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?)", [19, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
