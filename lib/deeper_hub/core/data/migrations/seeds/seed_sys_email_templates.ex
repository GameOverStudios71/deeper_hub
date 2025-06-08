defmodule DeeperHub.Core.Data.Migrations.Seeds.SysEmailTemplatesSeed do
  @moduledoc """
  Seed para a tabela sys_email_templates.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_email_templates...")

    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [2])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [3])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [4])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [5])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [6])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [7])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [8])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [9])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [10])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [11])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [12])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [13])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [14])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [15])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [16])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [17])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [18])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [19])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [20])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [21])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [22])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [23])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?)", [24])

    IO.puts("Registros inseridos com sucesso!")
  end
end
