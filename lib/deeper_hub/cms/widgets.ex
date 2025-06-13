defmodule DeeperHub.CMS.Widgets do
  @moduledoc """
  Contexto para gerenciar widgets do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Widgets.{Widget, WidgetType}

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
    WHERE w.is_active = true
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
end
