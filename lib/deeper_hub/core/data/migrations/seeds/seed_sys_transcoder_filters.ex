defmodule DeeperHub.Core.Data.Migrations.Seeds.SysTranscoderFiltersSeed do
  @moduledoc """
  Seed para a tabela sys_transcoder_filters.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_transcoder_filters...")

    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [1, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [2, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [3, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [4, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [5, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [6, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [7, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [8, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [9, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [10, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [11, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [12, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [13, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [14, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [15, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [16, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [17, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [18, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [19, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [20, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [21, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [22, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [23, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [24, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [25, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [26, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [27, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [28, 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?)", [29, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
