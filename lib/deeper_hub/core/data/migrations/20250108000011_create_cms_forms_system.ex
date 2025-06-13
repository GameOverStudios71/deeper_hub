defmodule DeeperHub.Core.Data.Migrations.CreateCmsFormsSystem do
  @moduledoc """
  Migration para criar o sistema de formulários do CMS.
  Baseado na análise das tabelas sys_form do UNA.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas do sistema de formulários.
  """
  def up do
    Logger.info("Criando sistema de formulários do CMS...", module: __MODULE__)

    with :ok <- create_form_field_types(),
         :ok <- create_forms(),
         :ok <- create_form_fields(),
         :ok <- create_form_displays(),
         :ok <- create_form_display_fields(),
         :ok <- create_form_pre_lists(),
         :ok <- create_form_pre_values(),
         :ok <- create_form_submissions(),
         :ok <- create_form_submission_data() do

      create_indexes()
      Logger.info("Sistema de formulários criado com sucesso!", module: __MODULE__)
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Remove as tabelas do sistema de formulários.
  """
  def down do
    Logger.info("Removendo sistema de formulários...", module: __MODULE__)

    tables = [
      "cms_form_submission_data",
      "cms_form_submissions",
      "cms_form_pre_values",
      "cms_form_pre_lists",
      "cms_form_display_fields",
      "cms_form_displays",
      "cms_form_fields",
      "cms_forms",
      "cms_form_field_types"
    ]

    Enum.each(tables, fn table ->
      case Repo.execute("DROP TABLE IF EXISTS #{table}") do
        {:ok, _} -> Logger.info("Tabela #{table} removida.", module: __MODULE__)
        {:error, reason} -> Logger.error("Erro ao remover #{table}: #{inspect(reason)}", module: __MODULE__)
      end
    end)

    :ok
  end

  # Criar tipos de campo de formulário
  defp create_form_field_types do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_field_types (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      input_type VARCHAR(32) NOT NULL, -- text, textarea, select, radio, checkbox, file, etc.
      validation_rules TEXT, -- JSON com regras padrão
      default_options TEXT, -- JSON com opções padrão
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_field_types criada.", module: __MODULE__)
        insert_default_field_types()
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_field_types: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar formulários
  defp create_forms do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_forms (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      module VARCHAR(32) NOT NULL DEFAULT 'cms',

      -- Configurações
      submit_name VARCHAR(255) DEFAULT 'Enviar',
      table_name VARCHAR(64) DEFAULT '', -- Tabela para salvar dados
      action_url VARCHAR(255) DEFAULT '',
      method VARCHAR(10) DEFAULT 'POST',
      enctype VARCHAR(50) DEFAULT 'multipart/form-data',

      -- Aparência
      form_attrs TEXT DEFAULT '', -- Atributos HTML do form
      css_class VARCHAR(255) DEFAULT '',
      template VARCHAR(255) DEFAULT 'form.html',

      -- Comportamento
      redirect_url VARCHAR(255) DEFAULT '',
      success_message TEXT DEFAULT 'Formulário enviado com sucesso!',
      error_message TEXT DEFAULT 'Erro ao enviar formulário.',

      -- Email
      email_template VARCHAR(255) DEFAULT '',
      email_to VARCHAR(255) DEFAULT '',
      email_subject VARCHAR(255) DEFAULT '',

      -- Configurações avançadas
      ajax_mode BOOLEAN DEFAULT 1,
      captcha_enabled BOOLEAN DEFAULT 0,
      honeypot_enabled BOOLEAN DEFAULT 1,
      rate_limit INTEGER DEFAULT 0, -- Limite por minuto

      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      created_by INTEGER,

      FOREIGN KEY (created_by) REFERENCES users(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_forms criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_forms: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar campos de formulário
  defp create_form_fields do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_fields (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      form_id INTEGER NOT NULL,
      name VARCHAR(64) NOT NULL,
      title VARCHAR(255) NOT NULL,
      description TEXT DEFAULT '',

      -- Tipo e configuração
      field_type_id INTEGER NOT NULL,
      input_type VARCHAR(32) NOT NULL,

      -- Validação
      is_required BOOLEAN DEFAULT 0,
      is_unique BOOLEAN DEFAULT 0,
      min_length INTEGER DEFAULT 0,
      max_length INTEGER DEFAULT 0,
      min_value DECIMAL(10,2) DEFAULT NULL,
      max_value DECIMAL(10,2) DEFAULT NULL,
      pattern VARCHAR(255) DEFAULT '',
      validation_message VARCHAR(255) DEFAULT '',

      -- Valores
      default_value TEXT DEFAULT '',
      placeholder VARCHAR(255) DEFAULT '',
      help_text TEXT DEFAULT '',

      -- Opções (para select, radio, checkbox)
      options_source VARCHAR(32) DEFAULT 'manual', -- manual, list, query, api
      options_list_id INTEGER DEFAULT NULL,
      options_data TEXT DEFAULT '', -- JSON

      -- Aparência
      css_class VARCHAR(255) DEFAULT '',
      wrapper_class VARCHAR(255) DEFAULT '',
      label_class VARCHAR(255) DEFAULT '',
      input_attrs TEXT DEFAULT '', -- Atributos HTML

      -- Comportamento
      is_searchable BOOLEAN DEFAULT 0,
      is_sortable BOOLEAN DEFAULT 0,
      is_filterable BOOLEAN DEFAULT 0,
      conditional_logic TEXT DEFAULT '', -- JSON

      -- Controle
      is_active BOOLEAN DEFAULT 1,
      order_index INTEGER DEFAULT 0,

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (form_id) REFERENCES cms_forms(id) ON DELETE CASCADE,
      FOREIGN KEY (field_type_id) REFERENCES cms_form_field_types(id),
      FOREIGN KEY (options_list_id) REFERENCES cms_form_pre_lists(id),
      CONSTRAINT unique_form_field UNIQUE (form_id, name)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_fields criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_fields: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar modos de exibição de formulário
  defp create_form_displays do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_displays (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      form_id INTEGER NOT NULL,
      name VARCHAR(64) NOT NULL,
      title VARCHAR(255) NOT NULL,
      description TEXT,

      -- Configurações
      display_type VARCHAR(32) DEFAULT 'form', -- form, view, edit, search
      template VARCHAR(255) DEFAULT '',
      css_class VARCHAR(255) DEFAULT '',

      -- Comportamento
      columns_number INTEGER DEFAULT 1,
      show_labels BOOLEAN DEFAULT 1,
      show_required_mark BOOLEAN DEFAULT 1,
      group_fields BOOLEAN DEFAULT 0,

      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_default BOOLEAN DEFAULT 0,
      order_index INTEGER DEFAULT 0,

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (form_id) REFERENCES cms_forms(id) ON DELETE CASCADE,
      CONSTRAINT unique_form_display UNIQUE (form_id, name)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_displays criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_displays: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar campos por modo de exibição
  defp create_form_display_fields do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_display_fields (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      display_id INTEGER NOT NULL,
      field_id INTEGER NOT NULL,

      -- Posicionamento
      order_index INTEGER DEFAULT 0,
      column_index INTEGER DEFAULT 1,
      row_index INTEGER DEFAULT 0,

      -- Aparência específica
      css_class VARCHAR(255) DEFAULT '',
      wrapper_class VARCHAR(255) DEFAULT '',
      width VARCHAR(32) DEFAULT 'auto', -- auto, 25%, 50%, 75%, 100%

      -- Comportamento específico
      is_visible BOOLEAN DEFAULT 1,
      is_readonly BOOLEAN DEFAULT 0,
      is_collapsed BOOLEAN DEFAULT 0,

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (display_id) REFERENCES cms_form_displays(id) ON DELETE CASCADE,
      FOREIGN KEY (field_id) REFERENCES cms_form_fields(id) ON DELETE CASCADE,
      CONSTRAINT unique_display_field UNIQUE (display_id, field_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_display_fields criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_display_fields: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar listas pré-definidas
  defp create_form_pre_lists do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_pre_lists (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      module VARCHAR(32) NOT NULL DEFAULT 'cms',

      -- Configurações
      list_type VARCHAR(32) DEFAULT 'static', -- static, dynamic, api
      source_table VARCHAR(64) DEFAULT '',
      source_query TEXT DEFAULT '',
      source_api_url VARCHAR(255) DEFAULT '',

      -- Cache
      cache_lifetime INTEGER DEFAULT 3600,

      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_pre_lists criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_pre_lists: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar valores das listas
  defp create_form_pre_values do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_pre_values (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      list_id INTEGER NOT NULL,
      value VARCHAR(255) NOT NULL,
      label VARCHAR(255) NOT NULL,
      description TEXT DEFAULT '',

      -- Configurações
      is_active BOOLEAN DEFAULT 1,
      is_default BOOLEAN DEFAULT 0,
      order_index INTEGER DEFAULT 0,

      -- Metadados
      extra_data TEXT DEFAULT '', -- JSON

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (list_id) REFERENCES cms_form_pre_lists(id) ON DELETE CASCADE,
      CONSTRAINT unique_list_value UNIQUE (list_id, value)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_pre_values criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_pre_values: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar submissões de formulário
  defp create_form_submissions do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_submissions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      form_id INTEGER NOT NULL,

      -- Identificação
      submission_uuid VARCHAR(36) NOT NULL UNIQUE,

      -- Dados do usuário
      user_id INTEGER DEFAULT NULL,
      user_ip VARCHAR(45) NOT NULL,
      user_agent TEXT DEFAULT '',

      -- Status
      status VARCHAR(32) DEFAULT 'pending', -- pending, approved, rejected, spam

      -- Dados de processamento
      processed_at DATETIME DEFAULT NULL,
      processed_by INTEGER DEFAULT NULL,

      -- Metadados
      referrer VARCHAR(255) DEFAULT '',
      utm_source VARCHAR(255) DEFAULT '',
      utm_medium VARCHAR(255) DEFAULT '',
      utm_campaign VARCHAR(255) DEFAULT '',

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (form_id) REFERENCES cms_forms(id) ON DELETE CASCADE,
      FOREIGN KEY (user_id) REFERENCES users(id),
      FOREIGN KEY (processed_by) REFERENCES users(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_submissions criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_submissions: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar dados das submissões
  defp create_form_submission_data do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_form_submission_data (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      submission_id INTEGER NOT NULL,
      field_id INTEGER NOT NULL,
      field_name VARCHAR(64) NOT NULL,
      field_value TEXT DEFAULT '',
      field_type VARCHAR(32) DEFAULT 'text',

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (submission_id) REFERENCES cms_form_submissions(id) ON DELETE CASCADE,
      FOREIGN KEY (field_id) REFERENCES cms_form_fields(id),
      CONSTRAINT unique_submission_field UNIQUE (submission_id, field_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_form_submission_data criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_form_submission_data: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Inserir tipos de campo padrão
  defp insert_default_field_types do
    types = [
      {1, "text", "Texto", "Campo de texto simples", "text", ~s({"maxlength": 255}), "{}"},
      {2, "textarea", "Área de Texto", "Campo de texto longo", "textarea", ~s({"rows": 4}), "{}"},
      {3, "email", "Email", "Campo de email", "email", ~s({"pattern": "email"}), "{}"},
      {4, "password", "Senha", "Campo de senha", "password", ~s({"minlength": 6}), "{}"},
      {5, "number", "Número", "Campo numérico", "number", "{}", "{}"},
      {6, "tel", "Telefone", "Campo de telefone", "tel", ~s({"pattern": "phone"}), "{}"},
      {7, "url", "URL", "Campo de URL", "url", ~s({"pattern": "url"}), "{}"},
      {8, "date", "Data", "Campo de data", "date", "{}", "{}"},
      {9, "datetime", "Data e Hora", "Campo de data e hora", "datetime-local", "{}", "{}"},
      {10, "time", "Hora", "Campo de hora", "time", "{}", "{}"},
      {11, "select", "Lista Suspensa", "Campo de seleção", "select", "{}", ~s({"multiple": false})},
      {12, "radio", "Botões de Rádio", "Seleção única", "radio", "{}", "{}"},
      {13, "checkbox", "Caixas de Seleção", "Seleção múltipla", "checkbox", "{}", "{}"},
      {14, "file", "Arquivo", "Upload de arquivo", "file", ~s({"accept": "*"}), "{}"},
      {15, "image", "Imagem", "Upload de imagem", "file", ~s({"accept": "image/*"}), "{}"},
      {16, "hidden", "Campo Oculto", "Campo oculto", "hidden", "{}", "{}"},
      {17, "range", "Intervalo", "Campo de intervalo", "range", ~s({"min": 0, "max": 100}), "{}"},
      {18, "color", "Cor", "Seletor de cor", "color", "{}", "{}"},
      {19, "search", "Busca", "Campo de busca", "search", "{}", "{}"},
      {20, "submit", "Botão Enviar", "Botão de envio", "submit", "{}", "{}"}
    ]

    Enum.each(types, fn {id, name, title, description, input_type, validation, options} ->
      sql = """
      INSERT OR REPLACE INTO cms_form_field_types
      (id, name, title, description, input_type, validation_rules, default_options, is_system, order_index)
      VALUES (?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, input_type, validation, options, id])
    end)

    :ok
  end

  # Criar índices para performance
  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_cms_forms_name ON cms_forms(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_forms_active ON cms_forms(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_forms_module ON cms_forms(module)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_fields_form ON cms_form_fields(form_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_fields_type ON cms_form_fields(field_type_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_fields_order ON cms_form_fields(form_id, order_index)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_fields_active ON cms_form_fields(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_displays_form ON cms_form_displays(form_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_displays_default ON cms_form_displays(is_default) WHERE is_default = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_display_fields_display ON cms_form_display_fields(display_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_display_fields_field ON cms_form_display_fields(field_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_display_fields_order ON cms_form_display_fields(display_id, order_index)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_pre_lists_name ON cms_form_pre_lists(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_pre_lists_active ON cms_form_pre_lists(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_pre_values_list ON cms_form_pre_values(list_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_pre_values_order ON cms_form_pre_values(list_id, order_index)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_submissions_form ON cms_form_submissions(form_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_submissions_uuid ON cms_form_submissions(submission_uuid)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_submissions_user ON cms_form_submissions(user_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_submissions_status ON cms_form_submissions(status)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_submissions_created ON cms_form_submissions(created_at)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_submission_data_submission ON cms_form_submission_data(submission_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_form_submission_data_field ON cms_form_submission_data(field_id)"
    ]

    Enum.each(indexes, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} -> :ok
        {:error, reason} ->
          Logger.warning("Falha ao criar índice: #{sql}, erro: #{inspect(reason)}", module: __MODULE__)
      end
    end)

    :ok
  end
end
