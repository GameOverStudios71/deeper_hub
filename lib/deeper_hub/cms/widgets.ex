defmodule DeeperHub.CMS.Widgets do
  @moduledoc """
  Contexto para gerenciar widgets do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Widgets.{Widget, WidgetType, WidgetInstance, WidgetSetting, WidgetBookmark}

  # ============================================================================
  # WIDGETS
  # ============================================================================

  @doc """
  Lista todos os widgets.
  """
  def list_widgets do
    sql = """
    SELECT w.id, w.name, w.title, w.description, w.widget_type_id, w.module,
           w.template, w.css_class, w.custom_css, w.content, w.content_type,
           w.config_data, w.api_endpoint, w.refresh_interval, w.visible_for_levels,
           w.is_active, w.is_featured, w.created_at, w.updated_at, w.created_by,
           wt.title as widget_type_title, wt.category as widget_type_category
    FROM cms_widgets w
    LEFT JOIN cms_widget_types wt ON w.widget_type_id = wt.id
    ORDER BY w.is_featured DESC, w.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        widgets = Enum.map(rows, &row_to_widget/1)
        {:ok, widgets}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista widgets ativos.
  """
  def list_active_widgets do
    sql = """
    SELECT w.id, w.name, w.title, w.description, w.widget_type_id, w.module,
           w.template, w.css_class, w.custom_css, w.content, w.content_type,
           w.config_data, w.api_endpoint, w.refresh_interval, w.visible_for_levels,
           w.is_active, w.is_featured, w.created_at, w.updated_at, w.created_by,
           wt.title as widget_type_title, wt.category as widget_type_category
    FROM cms_widgets w
    LEFT JOIN cms_widget_types wt ON w.widget_type_id = wt.id
    WHERE w.is_active IN ('true', 1, true)
    ORDER BY w.is_featured DESC, w.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        widgets = Enum.map(rows, &row_to_widget/1)
        {:ok, widgets}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista widgets em destaque.
  """
  def list_featured_widgets do
    sql = """
    SELECT w.id, w.name, w.title, w.description, w.widget_type_id, w.module,
           w.template, w.css_class, w.custom_css, w.content, w.content_type,
           w.config_data, w.api_endpoint, w.refresh_interval, w.visible_for_levels,
           w.is_active, w.is_featured, w.created_at, w.updated_at, w.created_by,
           wt.title as widget_type_title, wt.category as widget_type_category
    FROM cms_widgets w
    LEFT JOIN cms_widget_types wt ON w.widget_type_id = wt.id
    WHERE w.is_featured = true AND w.is_active = true
    ORDER BY w.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        widgets = Enum.map(rows, &row_to_widget/1)
        {:ok, widgets}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca widget por ID.
  """
  def get_widget(id) do
    sql = """
    SELECT w.id, w.name, w.title, w.description, w.widget_type_id, w.module,
           w.template, w.css_class, w.custom_css, w.content, w.content_type,
           w.config_data, w.api_endpoint, w.refresh_interval, w.visible_for_levels,
           w.is_active, w.is_featured, w.created_at, w.updated_at, w.created_by,
           wt.title as widget_type_title, wt.category as widget_type_category
    FROM cms_widgets w
    LEFT JOIN cms_widget_types wt ON w.widget_type_id = wt.id
    WHERE w.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        widget = row_to_widget(row)
        {:ok, widget}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca widget por nome.
  """
  def get_widget_by_name(name) do
    sql = """
    SELECT w.id, w.name, w.title, w.description, w.widget_type_id, w.module,
           w.template, w.css_class, w.custom_css, w.content, w.content_type,
           w.config_data, w.api_endpoint, w.refresh_interval, w.visible_for_levels,
           w.is_active, w.is_featured, w.created_at, w.updated_at, w.created_by,
           wt.title as widget_type_title, wt.category as widget_type_category
    FROM cms_widgets w
    LEFT JOIN cms_widget_types wt ON w.widget_type_id = wt.id
    WHERE w.name = $1
    """

    case Connection.query(sql, [name]) do
      {:ok, %{rows: [row]}} ->
        widget = row_to_widget(row)
        {:ok, widget}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista widgets por tipo.
  """
  def list_widgets_by_type(widget_type_id) do
    sql = """
    SELECT w.id, w.name, w.title, w.description, w.widget_type_id, w.module,
           w.template, w.css_class, w.custom_css, w.content, w.content_type,
           w.config_data, w.api_endpoint, w.refresh_interval, w.visible_for_levels,
           w.is_active, w.is_featured, w.created_at, w.updated_at, w.created_by,
           wt.title as widget_type_title, wt.category as widget_type_category
    FROM cms_widgets w
    LEFT JOIN cms_widget_types wt ON w.widget_type_id = wt.id
    WHERE w.widget_type_id = $1 AND w.is_active = true
    ORDER BY w.title ASC
    """

    case Connection.query(sql, [widget_type_id]) do
      {:ok, %{rows: rows}} ->
        widgets = Enum.map(rows, &row_to_widget/1)
        {:ok, widgets}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo widget.
  """
  def create_widget(attrs) do
    case Widget.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO cms_widgets (
          name, title, description, widget_type_id, module, template, css_class,
          custom_css, content, content_type, config_data, api_endpoint, refresh_interval,
          visible_for_levels, is_active, is_featured, created_at, updated_at, created_by
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19
        ) RETURNING id
        """

        params = [
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:widget_type_id],
          validated_attrs[:module] || "cms",
          validated_attrs[:template] || "",
          validated_attrs[:css_class] || "",
          validated_attrs[:custom_css] || "",
          validated_attrs[:content] || "",
          validated_attrs[:content_type] || "html",
          validated_attrs[:config_data] || "",
          validated_attrs[:api_endpoint] || "",
          validated_attrs[:refresh_interval] || 0,
          validated_attrs[:visible_for_levels] || 2147483647,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_featured] || false,
          now,
          now,
          validated_attrs[:created_by]
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_widget(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza um widget.
  """
  def update_widget(id, attrs) do
    case Widget.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        UPDATE cms_widgets SET
          name = $2, title = $3, description = $4, widget_type_id = $5, module = $6,
          template = $7, css_class = $8, custom_css = $9, content = $10, content_type = $11,
          config_data = $12, api_endpoint = $13, refresh_interval = $14, visible_for_levels = $15,
          is_active = $16, is_featured = $17, updated_at = $18, created_by = $19
        WHERE id = $1
        """

        params = [
          id,
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:widget_type_id],
          validated_attrs[:module] || "cms",
          validated_attrs[:template] || "",
          validated_attrs[:css_class] || "",
          validated_attrs[:custom_css] || "",
          validated_attrs[:content] || "",
          validated_attrs[:content_type] || "html",
          validated_attrs[:config_data] || "",
          validated_attrs[:api_endpoint] || "",
          validated_attrs[:refresh_interval] || 0,
          validated_attrs[:visible_for_levels] || 2147483647,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_featured] || false,
          now,
          validated_attrs[:created_by]
        ]

        case Connection.query(sql, params) do
          {:ok, _} ->
            get_widget(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Deleta um widget.
  """
  def delete_widget(id) do
    sql = "DELETE FROM cms_widgets WHERE id = $1"

    case Connection.query(sql, [id]) do
      {:ok, %{num_rows: 1}} ->
        :ok
      {:ok, %{num_rows: 0}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # WIDGET TYPES
  # ============================================================================

  @doc """
  Lista todos os tipos de widget.
  """
  def list_widget_types do
    sql = """
    SELECT id, name, title, description, category, template, icon, preview_image,
           has_settings, has_content, is_cacheable, cache_lifetime, supported_positions,
           min_width, max_width, is_active, is_system, created_at, order_index
    FROM cms_widget_types
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        types = Enum.map(rows, &row_to_widget_type/1)
        {:ok, types}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_widget([id, name, title, description, widget_type_id, module,
                      template, css_class, custom_css, content, content_type,
                      config_data, api_endpoint, refresh_interval, visible_for_levels,
                      is_active, is_featured, created_at, updated_at, created_by,
                      widget_type_title, widget_type_category]) do
    Widget.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      widget_type_id: widget_type_id,
      module: module,
      template: template,
      css_class: css_class,
      custom_css: custom_css,
      content: content,
      content_type: content_type,
      config_data: config_data,
      api_endpoint: api_endpoint,
      refresh_interval: refresh_interval,
      visible_for_levels: visible_for_levels,
      is_active: is_active,
      is_featured: is_featured,
      created_at: created_at,
      updated_at: updated_at,
      created_by: created_by,
      widget_type_title: widget_type_title,
      widget_type_category: widget_type_category
    })
  end

  defp row_to_widget_type([id, name, title, description, category, template, icon, preview_image,
                           has_settings, has_content, is_cacheable, cache_lifetime, supported_positions,
                           min_width, max_width, is_active, is_system, created_at, order_index]) do
    WidgetType.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      category: category,
      template: template,
      icon: icon,
      preview_image: preview_image,
      has_settings: has_settings,
      has_content: has_content,
      is_cacheable: is_cacheable,
      cache_lifetime: cache_lifetime,
      supported_positions: supported_positions,
      min_width: min_width,
      max_width: max_width,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      order_index: order_index
    })
  end

  # ============================================================================
  # WIDGET TYPES - CRUD METHODS
  # ============================================================================

  @doc """
  Cria um novo tipo de widget.
  """
  def create_widget_type(attrs) do
    sql = """
    INSERT INTO cms_widget_types (name, title, description, category, template, icon,
                                  preview_image, has_settings, has_content, is_cacheable,
                                  cache_lifetime, supported_positions, min_width, max_width,
                                  is_active, is_system, order_index)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:name],
      attrs[:title],
      attrs[:description] || "",
      attrs[:category] || "general",
      attrs[:template],
      attrs[:icon] || "",
      attrs[:preview_image] || "",
      if(attrs[:has_settings] == false, do: 0, else: 1),
      if(attrs[:has_content] == false, do: 0, else: 1),
      if(attrs[:is_cacheable] == false, do: 0, else: 1),
      attrs[:cache_lifetime] || 3600,
      attrs[:supported_positions] || "",
      attrs[:min_width] || 0,
      attrs[:max_width] || 0,
      if(attrs[:is_active] == false, do: 0, else: 1),
      if(attrs[:is_system] == true, do: 1, else: 0),
      attrs[:order_index] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_widget_types WHERE name = ? ORDER BY id DESC LIMIT 1", [attrs[:name]]) do
          {:ok, %{rows: [[id]]}} ->
            get_widget_type(id)
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
  Obtém um tipo de widget específico pelo ID.
  """
  def get_widget_type(id) do
    sql = """
    SELECT id, name, title, description, category, template, icon, preview_image,
           has_settings, has_content, is_cacheable, cache_lifetime, supported_positions,
           min_width, max_width, is_active, is_system, created_at, order_index
    FROM cms_widget_types
    WHERE id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        type = row_to_widget_type(row)
        {:ok, type}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # WIDGET INSTANCES
  # ============================================================================

  @doc """
  Lista todas as instâncias de widget.
  """
  def list_widget_instances do
    sql = """
    SELECT wi.id, wi.widget_id, wi.page_id, wi.position, wi.cell_id, wi.order_index,
           wi.instance_title, wi.instance_config, wi.custom_css, wi.design_box_id,
           wi.show_title, wi.is_active, wi.is_collapsed, wi.hidden_on, wi.cache_lifetime,
           wi.created_at, wi.updated_at, w.title as widget_title
    FROM cms_widget_instances wi
    LEFT JOIN cms_widgets w ON wi.widget_id = w.id
    ORDER BY wi.page_id ASC, wi.position ASC, wi.order_index ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        instances = Enum.map(rows, &row_to_widget_instance/1)
        {:ok, instances}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria uma nova instância de widget.
  """
  def create_widget_instance(attrs) do
    sql = """
    INSERT INTO cms_widget_instances (widget_id, page_id, position, cell_id, order_index,
                                      instance_title, instance_config, custom_css, design_box_id,
                                      show_title, is_active, is_collapsed, hidden_on, cache_lifetime)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:widget_id],
      attrs[:page_id],
      attrs[:position] || "sidebar",
      attrs[:cell_id] || 1,
      attrs[:order_index] || 0,
      attrs[:instance_title] || "",
      attrs[:instance_config] || "",
      attrs[:custom_css] || "",
      attrs[:design_box_id] || 1,
      if(attrs[:show_title] == false, do: 0, else: 1),
      if(attrs[:is_active] == false, do: 0, else: 1),
      if(attrs[:is_collapsed] == true, do: 1, else: 0),
      attrs[:hidden_on] || "",
      attrs[:cache_lifetime] || ""
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_widget_instances WHERE widget_id = ? AND position = ? ORDER BY id DESC LIMIT 1", [attrs[:widget_id], attrs[:position]]) do
          {:ok, %{rows: [[id]]}} ->
            get_widget_instance(id)
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
  Obtém uma instância específica pelo ID.
  """
  def get_widget_instance(id) do
    sql = """
    SELECT wi.id, wi.widget_id, wi.page_id, wi.position, wi.cell_id, wi.order_index,
           wi.instance_title, wi.instance_config, wi.custom_css, wi.design_box_id,
           wi.show_title, wi.is_active, wi.is_collapsed, wi.hidden_on, wi.cache_lifetime,
           wi.created_at, wi.updated_at, w.title as widget_title
    FROM cms_widget_instances wi
    LEFT JOIN cms_widgets w ON wi.widget_id = w.id
    WHERE wi.id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        instance = row_to_widget_instance(row)
        {:ok, instance}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # Helper functions for row conversion
  defp row_to_widget_instance(row) do
    [id, widget_id, page_id, position, cell_id, order_index, instance_title, instance_config,
     custom_css, design_box_id, show_title, is_active, is_collapsed, hidden_on, cache_lifetime,
     created_at, updated_at, _widget_title] = row

    WidgetInstance.new(%{
      id: id,
      widget_id: widget_id,
      page_id: page_id,
      position: position,
      cell_id: cell_id,
      order_index: order_index,
      instance_title: instance_title,
      instance_config: instance_config,
      custom_css: custom_css,
      design_box_id: design_box_id,
      show_title: show_title == 1,
      is_active: is_active == 1,
      is_collapsed: is_collapsed == 1,
      hidden_on: hidden_on,
      cache_lifetime: cache_lifetime,
      created_at: created_at,
      updated_at: updated_at
    })
  end

  # ============================================================================
  # WIDGET SETTINGS
  # ============================================================================

  @doc """
  Lista todas as configurações de widget.
  """
  def list_widget_settings do
    sql = """
    SELECT ws.id, ws.widget_id, ws.instance_id, ws.setting_key, ws.setting_value,
           ws.setting_type, ws.setting_group, ws.setting_order, ws.created_at, ws.updated_at
    FROM cms_widget_settings ws
    ORDER BY ws.widget_id ASC, ws.instance_id ASC, ws.setting_key ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        settings = Enum.map(rows, &row_to_widget_setting/1)
        {:ok, settings}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria uma nova configuração de widget.
  """
  def create_widget_setting(attrs) do
    sql = """
    INSERT INTO cms_widget_settings (widget_id, instance_id, setting_key, setting_value,
                                     setting_type, setting_group, setting_order)
    VALUES (?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:widget_id],
      attrs[:instance_id],
      attrs[:setting_key],
      attrs[:setting_value],
      attrs[:setting_type] || "text",
      attrs[:setting_group] || "general",
      attrs[:setting_order] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_widget_settings WHERE setting_key = ? ORDER BY id DESC LIMIT 1", [attrs[:setting_key]]) do
          {:ok, %{rows: [[id]]}} ->
            get_widget_setting(id)
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
  def get_widget_setting(id) do
    sql = """
    SELECT ws.id, ws.widget_id, ws.instance_id, ws.setting_key, ws.setting_value,
           ws.setting_type, ws.setting_group, ws.setting_order, ws.created_at, ws.updated_at
    FROM cms_widget_settings ws
    WHERE ws.id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        setting = row_to_widget_setting(row)
        {:ok, setting}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # WIDGET BOOKMARKS
  # ============================================================================

  @doc """
  Lista todos os favoritos de widget.
  """
  def list_widget_bookmarks do
    sql = """
    SELECT wb.id, wb.widget_id, wb.user_id, wb.is_bookmarked, wb.created_at, wb.updated_at,
           w.title as widget_title
    FROM cms_widget_bookmarks wb
    LEFT JOIN cms_widgets w ON wb.widget_id = w.id
    ORDER BY wb.created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        bookmarks = Enum.map(rows, &row_to_widget_bookmark/1)
        {:ok, bookmarks}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo favorito de widget.
  """
  def create_widget_bookmark(attrs) do
    sql = """
    INSERT INTO cms_widget_bookmarks (widget_id, user_id, is_bookmarked)
    VALUES (?, ?, ?)
    """

    params = [
      attrs[:widget_id],
      attrs[:user_id],
      if(attrs[:is_bookmarked] == false, do: 0, else: 1)
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_widget_bookmarks WHERE widget_id = ? AND user_id = ? ORDER BY id DESC LIMIT 1", [attrs[:widget_id], attrs[:user_id]]) do
          {:ok, %{rows: [[id]]}} ->
            get_widget_bookmark(id)
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
  Obtém um favorito específico pelo ID.
  """
  def get_widget_bookmark(id) do
    sql = """
    SELECT wb.id, wb.widget_id, wb.user_id, wb.is_bookmarked, wb.created_at, wb.updated_at,
           w.title as widget_title
    FROM cms_widget_bookmarks wb
    LEFT JOIN cms_widgets w ON wb.widget_id = w.id
    WHERE wb.id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        bookmark = row_to_widget_bookmark(row)
        {:ok, bookmark}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # Helper functions for row conversion
  defp row_to_widget_setting(row) do
    [id, widget_id, instance_id, setting_key, setting_value, setting_type, setting_group, setting_order, created_at, updated_at] = row

    WidgetSetting.new(%{
      id: id,
      widget_id: widget_id,
      instance_id: instance_id,
      setting_key: setting_key,
      setting_value: setting_value,
      setting_type: setting_type,
      setting_group: setting_group,
      setting_order: setting_order,
      created_at: created_at,
      updated_at: updated_at
    })
  end

  defp row_to_widget_bookmark(row) do
    [id, widget_id, user_id, is_bookmarked, created_at, updated_at, _widget_title] = row

    WidgetBookmark.new(%{
      id: id,
      widget_id: widget_id,
      user_id: user_id,
      is_bookmarked: is_bookmarked == 1,
      created_at: created_at,
      updated_at: updated_at
    })
  end
end
