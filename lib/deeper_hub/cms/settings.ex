defmodule DeeperHub.CMS.Settings do
  @moduledoc """
  Contexto para gerenciar configurações do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Settings.{SettingCategory, SettingType, Setting, Theme}

  # ============================================================================
  # SETTING CATEGORIES
  # ============================================================================

  @doc """
  Lista todas as categorias de configuração.
  """
  def list_setting_categories do
    sql = """
    SELECT id, name, title, description, icon, is_active, is_system, created_at, order_index
    FROM cms_setting_categories
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        categories = Enum.map(rows, &row_to_setting_category/1)
        {:ok, categories}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista categorias ativas.
  """
  def list_active_setting_categories do
    sql = """
    SELECT id, name, title, description, icon, is_active, is_system, created_at, order_index
    FROM cms_setting_categories
    WHERE is_active = true
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        categories = Enum.map(rows, &row_to_setting_category/1)
        {:ok, categories}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # SETTING TYPES
  # ============================================================================

  @doc """
  Lista todos os tipos de configuração.
  """
  def list_setting_types do
    sql = """
    SELECT id, name, title, description, input_type, validation_rules, default_options,
           is_active, is_system, created_at, order_index
    FROM cms_setting_types
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        types = Enum.map(rows, &row_to_setting_type/1)
        {:ok, types}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # SETTINGS
  # ============================================================================

  @doc """
  Lista todas as configurações.
  """
  def list_settings do
    sql = """
    SELECT s.id, s.category_id, s.setting_type_id, s.name, s.title, s.description,
           s.value, s.default_value, s.options, s.validation_rules, s.placeholder,
           s.help_text, s.is_required, s.is_readonly, s.is_translatable, s.is_active,
           s.is_system, s.created_at, s.updated_at, s.order_index,
           c.title as category_title, t.title as type_title, t.input_type
    FROM cms_settings s
    LEFT JOIN cms_setting_categories c ON s.category_id = c.id
    LEFT JOIN cms_setting_types t ON s.setting_type_id = t.id
    ORDER BY c.order_index ASC, s.order_index ASC, s.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        settings = Enum.map(rows, &row_to_setting/1)
        {:ok, settings}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista configurações por categoria.
  """
  def list_settings_by_category(category_id) do
    sql = """
    SELECT s.id, s.category_id, s.setting_type_id, s.name, s.title, s.description,
           s.value, s.default_value, s.options, s.validation_rules, s.placeholder,
           s.help_text, s.is_required, s.is_readonly, s.is_translatable, s.is_active,
           s.is_system, s.created_at, s.updated_at, s.order_index,
           c.title as category_title, t.title as type_title, t.input_type
    FROM cms_settings s
    LEFT JOIN cms_setting_categories c ON s.category_id = c.id
    LEFT JOIN cms_setting_types t ON s.setting_type_id = t.id
    WHERE s.category_id = $1 AND s.is_active = true
    ORDER BY s.order_index ASC, s.title ASC
    """

    case Connection.query(sql, [category_id]) do
      {:ok, %{rows: rows}} ->
        settings = Enum.map(rows, &row_to_setting/1)
        {:ok, settings}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca configuração por nome.
  """
  def get_setting_by_name(name) do
    sql = """
    SELECT s.id, s.category_id, s.setting_type_id, s.name, s.title, s.description,
           s.value, s.default_value, s.options, s.validation_rules, s.placeholder,
           s.help_text, s.is_required, s.is_readonly, s.is_translatable, s.is_active,
           s.is_system, s.created_at, s.updated_at, s.order_index,
           c.title as category_title, t.title as type_title, t.input_type
    FROM cms_settings s
    LEFT JOIN cms_setting_categories c ON s.category_id = c.id
    LEFT JOIN cms_setting_types t ON s.setting_type_id = t.id
    WHERE s.name = $1
    """

    case Connection.query(sql, [name]) do
      {:ok, %{rows: [row]}} ->
        setting = row_to_setting(row)
        {:ok, setting}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Atualiza valor de uma configuração.
  """
  def update_setting_value(name, value) do
    now = DateTime.utc_now()

    sql = """
    UPDATE cms_settings
    SET value = $2, updated_at = $3
    WHERE name = $1
    """

    case Connection.query(sql, [name, value, now]) do
      {:ok, %{num_rows: 1}} ->
        get_setting_by_name(name)
      {:ok, %{num_rows: 0}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # THEMES
  # ============================================================================

  @doc """
  Lista todos os temas.
  """
  def list_themes do
    sql = """
    SELECT id, name, title, description, template_path, css_file, js_file,
           preview_image, version, author, author_url, supports_dark_mode,
           is_responsive, min_width, is_active, is_default, is_system,
           order_index, created_at, updated_at
    FROM cms_themes
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        themes = Enum.map(rows, &row_to_theme/1)
        {:ok, themes}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista temas ativos.
  """
  def list_active_themes do
    sql = """
    SELECT id, name, title, description, template_path, css_file, js_file,
           preview_image, version, author, author_url, supports_dark_mode,
           is_responsive, min_width, is_active, is_default, is_system,
           order_index, created_at, updated_at
    FROM cms_themes
    WHERE is_active = true
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        themes = Enum.map(rows, &row_to_theme/1)
        {:ok, themes}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca tema por ID.
  """
  def get_theme(id) do
    sql = """
    SELECT id, name, title, description, template_path, css_file, js_file,
           preview_image, version, author, author_url, supports_dark_mode,
           is_responsive, min_width, is_active, is_default, is_system,
           order_index, created_at, updated_at
    FROM cms_themes
    WHERE id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        theme = row_to_theme(row)
        {:ok, theme}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca tema por nome.
  """
  def get_theme_by_name(name) do
    sql = """
    SELECT id, name, title, description, template_path, css_file, js_file,
           preview_image, version, author, author_url, supports_dark_mode,
           is_responsive, min_width, is_active, is_default, is_system,
           order_index, created_at, updated_at
    FROM cms_themes
    WHERE name = $1
    """

    case Connection.query(sql, [name]) do
      {:ok, %{rows: [row]}} ->
        theme = row_to_theme(row)
        {:ok, theme}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca tema padrão.
  """
  def get_default_theme do
    sql = """
    SELECT id, name, title, description, template_path, css_file, js_file,
           preview_image, version, author, author_url, supports_dark_mode,
           is_responsive, min_width, is_active, is_default, is_system,
           order_index, created_at, updated_at
    FROM cms_themes
    WHERE is_default = true AND is_active = true
    LIMIT 1
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: [row]}} ->
        theme = row_to_theme(row)
        {:ok, theme}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo tema.
  """
  def create_theme(attrs) do
    case Theme.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO cms_themes (
          name, title, description, template_path, css_file, js_file,
          preview_image, version, author, author_url, supports_dark_mode,
          is_responsive, min_width, is_active, is_default, is_system,
          order_index, created_at, updated_at
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19
        ) RETURNING id
        """

        params = [
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:template_path],
          validated_attrs[:css_file] || "",
          validated_attrs[:js_file] || "",
          validated_attrs[:preview_image] || "",
          validated_attrs[:version] || "1.0.0",
          validated_attrs[:author] || "",
          validated_attrs[:author_url] || "",
          validated_attrs[:supports_dark_mode] || false,
          validated_attrs[:is_responsive] || true,
          validated_attrs[:min_width] || 320,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_default] || false,
          validated_attrs[:is_system] || false,
          validated_attrs[:order_index] || 0,
          now,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_theme(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza um tema.
  """
  def update_theme(id, attrs) do
    case Theme.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        UPDATE cms_themes SET
          name = $2, title = $3, description = $4, template_path = $5,
          css_file = $6, js_file = $7, preview_image = $8, version = $9,
          author = $10, author_url = $11, supports_dark_mode = $12,
          is_responsive = $13, min_width = $14, is_active = $15,
          is_default = $16, is_system = $17, order_index = $18, updated_at = $19
        WHERE id = $1
        """

        params = [
          id,
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:template_path],
          validated_attrs[:css_file] || "",
          validated_attrs[:js_file] || "",
          validated_attrs[:preview_image] || "",
          validated_attrs[:version] || "1.0.0",
          validated_attrs[:author] || "",
          validated_attrs[:author_url] || "",
          validated_attrs[:supports_dark_mode] || false,
          validated_attrs[:is_responsive] || true,
          validated_attrs[:min_width] || 320,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_default] || false,
          validated_attrs[:is_system] || false,
          validated_attrs[:order_index] || 0,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, _} ->
            get_theme(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Deleta um tema.
  """
  def delete_theme(id) do
    sql = "DELETE FROM cms_themes WHERE id = $1 AND is_system = false"

    case Connection.query(sql, [id]) do
      {:ok, %{num_rows: 1}} ->
        :ok
      {:ok, %{num_rows: 0}} ->
        {:error, :not_found_or_system}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_setting_category([id, name, title, description, icon, is_active, is_system, created_at, order_index]) do
    SettingCategory.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      icon: icon,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      order_index: order_index
    })
  end

  defp row_to_setting_type([id, name, title, description, input_type, validation_rules, default_options,
                            is_active, is_system, created_at, order_index]) do
    SettingType.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      input_type: input_type,
      validation_rules: validation_rules,
      default_options: default_options,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      order_index: order_index
    })
  end

  defp row_to_setting([id, category_id, setting_type_id, name, title, description,
                       value, default_value, options, validation_rules, placeholder,
                       help_text, is_required, is_readonly, is_translatable, is_active,
                       is_system, created_at, updated_at, order_index,
                       category_title, type_title, input_type]) do
    Setting.new(%{
      id: id,
      category_id: category_id,
      setting_type_id: setting_type_id,
      name: name,
      title: title,
      description: description,
      value: value,
      default_value: default_value,
      options: options,
      validation_rules: validation_rules,
      placeholder: placeholder,
      help_text: help_text,
      is_required: is_required,
      is_readonly: is_readonly,
      is_translatable: is_translatable,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      updated_at: updated_at,
      order_index: order_index,
      category_title: category_title,
      type_title: type_title,
      input_type: input_type
    })
  end

  defp row_to_theme([id, name, title, description, template_path, css_file, js_file,
                     preview_image, version, author, author_url, supports_dark_mode,
                     is_responsive, min_width, is_active, is_default, is_system,
                     order_index, created_at, updated_at]) do
    Theme.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      template_path: template_path,
      css_file: css_file,
      js_file: js_file,
      preview_image: preview_image,
      version: version,
      author: author,
      author_url: author_url,
      supports_dark_mode: supports_dark_mode,
      is_responsive: is_responsive,
      min_width: min_width,
      is_active: is_active,
      is_default: is_default,
      is_system: is_system,
      order_index: order_index,
      created_at: created_at,
      updated_at: updated_at
    })
  end

  # ============================================================================
  # SETTING CATEGORIES - CRUD METHODS
  # ============================================================================

  @doc """
  Cria uma nova categoria de configuração.
  """
  def create_setting_category(attrs) do
    sql = """
    INSERT INTO cms_setting_categories (name, title, description, icon, is_active, order_index)
    VALUES (?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:name],
      attrs[:title],
      attrs[:description] || "",
      attrs[:icon] || "",
      if(attrs[:is_active] == false, do: 0, else: 1),
      attrs[:order_index] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_setting_categories WHERE name = ? ORDER BY id DESC LIMIT 1", [attrs[:name]]) do
          {:ok, %{rows: [[id]]}} ->
            get_setting_category(id)
          {:ok, %{rows: []}} ->
            {:error, :not_found}
          {:error, error} ->
            {:error, error}
        end
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém uma categoria específica pelo ID.
  """
  def get_setting_category(id) do
    sql = """
    SELECT id, name, title, description, icon, is_active, is_system, created_at, order_index
    FROM cms_setting_categories
    WHERE id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        category = row_to_setting_category(row)
        {:ok, category}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # SETTING TYPES - CRUD METHODS
  # ============================================================================

  @doc """
  Cria um novo tipo de configuração.
  """
  def create_setting_type(attrs) do
    sql = """
    INSERT INTO cms_setting_types (name, title, description, input_type, validation_rules, default_options, is_active, order_index)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:name],
      attrs[:title],
      attrs[:description] || "",
      attrs[:input_type] || "text",
      attrs[:validation_rules] || "",
      attrs[:default_options] || "",
      if(attrs[:is_active] == false, do: 0, else: 1),
      attrs[:order_index] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_setting_types WHERE name = ? ORDER BY id DESC LIMIT 1", [attrs[:name]]) do
          {:ok, %{rows: [[id]]}} ->
            get_setting_type(id)
          {:ok, %{rows: []}} ->
            {:error, :not_found}
          {:error, error} ->
            {:error, error}
        end
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém um tipo específico pelo ID.
  """
  def get_setting_type(id) do
    sql = """
    SELECT id, name, title, description, input_type, validation_rules, default_options, is_active, is_system, created_at, order_index
    FROM cms_setting_types
    WHERE id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        type = row_to_setting_type(row)
        {:ok, type}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # SETTINGS - CRUD METHODS
  # ============================================================================

  @doc """
  Cria uma nova configuração.
  """
  def create_setting(attrs) do
    sql = """
    INSERT INTO cms_settings (category_id, setting_type_id, name, title, description, value, default_value,
                              options, validation_rules, placeholder, help_text, css_class, is_required,
                              is_readonly, is_translatable, is_active, order_index)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:category_id],
      attrs[:setting_type_id],
      attrs[:name],
      attrs[:title],
      attrs[:description] || "",
      attrs[:value] || "",
      attrs[:default_value] || "",
      attrs[:options] || "",
      attrs[:validation_rules] || "",
      attrs[:placeholder] || "",
      attrs[:help_text] || "",
      attrs[:css_class] || "",
      if(attrs[:is_required] == true, do: 1, else: 0),
      if(attrs[:is_readonly] == true, do: 1, else: 0),
      if(attrs[:is_translatable] == true, do: 1, else: 0),
      if(attrs[:is_active] == false, do: 0, else: 1),
      attrs[:order_index] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_settings WHERE name = ? ORDER BY id DESC LIMIT 1", [attrs[:name]]) do
          {:ok, %{rows: [[id]]}} ->
            get_setting(id)
          {:ok, %{rows: []}} ->
            {:error, :not_found}
          {:error, error} ->
            {:error, error}
        end
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém uma configuração específica pelo ID.
  """
  def get_setting(id) do
    sql = """
    SELECT s.id, s.category_id, s.setting_type_id, s.name, s.title, s.description,
           s.value, s.default_value, s.options, s.validation_rules, s.placeholder,
           s.help_text, s.is_required, s.is_readonly, s.is_translatable, s.is_active,
           s.is_system, s.created_at, s.updated_at, s.order_index,
           c.title as category_title, t.title as type_title, t.input_type
    FROM cms_settings s
    LEFT JOIN cms_setting_categories c ON s.category_id = c.id
    LEFT JOIN cms_setting_types t ON s.setting_type_id = t.id
    WHERE s.id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        setting = row_to_setting(row)
        {:ok, setting}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # THEME SETTINGS - CRUD METHODS
  # ============================================================================

  @doc """
  Lista todas as configurações de tema.
  """
  def list_theme_settings do
    sql = """
    SELECT ts.id, ts.theme_id, ts.setting_id, ts.value, ts.created_at, ts.updated_at,
           t.title as theme_title, s.name as setting_name, s.title as setting_title,
           s.description as setting_description, st.input_type as setting_type
    FROM cms_theme_settings ts
    LEFT JOIN cms_themes t ON ts.theme_id = t.id
    LEFT JOIN cms_settings s ON ts.setting_id = s.id
    LEFT JOIN cms_setting_types st ON s.setting_type_id = st.id
    ORDER BY ts.theme_id ASC, s.order_index ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        theme_settings = Enum.map(rows, &row_to_theme_setting_corrected/1)
        {:ok, theme_settings}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria uma nova configuração de tema.
  """
  def create_theme_setting(attrs) do
    sql = """
    INSERT INTO cms_theme_settings (theme_id, setting_id, value)
    VALUES (?, ?, ?)
    """

    params = [
      attrs[:theme_id],
      attrs[:setting_id],
      attrs[:value] || ""
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_theme_settings WHERE theme_id = ? AND setting_id = ? ORDER BY id DESC LIMIT 1", [attrs[:theme_id], attrs[:setting_id]]) do
          {:ok, %{rows: [[id]]}} ->
            get_theme_setting(id)
          {:ok, %{rows: []}} ->
            {:error, :not_found}
          {:error, error} ->
            {:error, error}
        end
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém uma configuração de tema específica pelo ID.
  """
  def get_theme_setting(id) do
    sql = """
    SELECT ts.id, ts.theme_id, ts.setting_id, ts.value, ts.created_at, ts.updated_at,
           t.title as theme_title, s.name as setting_name, s.title as setting_title,
           s.description as setting_description, st.input_type as setting_type
    FROM cms_theme_settings ts
    LEFT JOIN cms_themes t ON ts.theme_id = t.id
    LEFT JOIN cms_settings s ON ts.setting_id = s.id
    LEFT JOIN cms_setting_types st ON s.setting_type_id = st.id
    WHERE ts.id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        theme_setting = row_to_theme_setting_corrected(row)
        {:ok, theme_setting}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPER FUNCTIONS FOR NEW METHODS
  # ============================================================================

  defp row_to_theme_setting_corrected([id, theme_id, setting_id, value, created_at, updated_at, theme_title, setting_name, setting_title, setting_description, setting_type]) do
    %{
      id: id,
      theme_id: theme_id,
      setting_id: setting_id,
      setting_name: setting_name,
      setting_title: setting_title,
      setting_description: setting_description,
      setting_value: value,
      setting_type: setting_type,
      created_at: created_at,
      updated_at: updated_at,
      theme_title: theme_title
    }
  end


end
