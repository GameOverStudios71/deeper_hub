defmodule DeeperHub.CMS.Menus do
  @moduledoc """
  Contexto para gerenciar menus do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Menus.{MenuSet, MenuTemplate, MenuItem}

  # ============================================================================
  # MENU SETS
  # ============================================================================

  @doc """
  Lista todos os conjuntos de menu.
  """
  def list_menu_sets do
    sql = """
    SELECT ms.id, ms.name, ms.title, ms.description, ms.template_id, ms.css_class,
           ms.custom_css, ms.max_depth, ms.show_icons, ms.show_badges, ms.responsive,
           ms.visible_for_levels, ms.is_active, ms.is_system, ms.created_at, ms.updated_at,
           ms.created_by, mt.title as template_title, mt.name as template_name
    FROM cms_menu_sets ms
    LEFT JOIN cms_menu_templates mt ON ms.template_id = mt.id
    ORDER BY ms.is_system ASC, ms.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        menu_sets = Enum.map(rows, &row_to_menu_set/1)
        {:ok, menu_sets}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista conjuntos de menu ativos.
  """
  def list_active_menu_sets do
    sql = """
    SELECT ms.id, ms.name, ms.title, ms.description, ms.template_id, ms.css_class,
           ms.custom_css, ms.max_depth, ms.show_icons, ms.show_badges, ms.responsive,
           ms.visible_for_levels, ms.is_active, ms.is_system, ms.created_at, ms.updated_at,
           ms.created_by, mt.title as template_title, mt.name as template_name
    FROM cms_menu_sets ms
    LEFT JOIN cms_menu_templates mt ON ms.template_id = mt.id
    WHERE ms.is_active = true
    ORDER BY ms.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        menu_sets = Enum.map(rows, &row_to_menu_set/1)
        {:ok, menu_sets}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca conjunto de menu por ID.
  """
  def get_menu_set(id) do
    sql = """
    SELECT ms.id, ms.name, ms.title, ms.description, ms.template_id, ms.css_class,
           ms.custom_css, ms.max_depth, ms.show_icons, ms.show_badges, ms.responsive,
           ms.visible_for_levels, ms.is_active, ms.is_system, ms.created_at, ms.updated_at,
           ms.created_by, mt.title as template_title, mt.name as template_name
    FROM cms_menu_sets ms
    LEFT JOIN cms_menu_templates mt ON ms.template_id = mt.id
    WHERE ms.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        menu_set = row_to_menu_set(row)
        {:ok, menu_set}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca conjunto de menu por nome.
  """
  def get_menu_set_by_name(name) do
    sql = """
    SELECT ms.id, ms.name, ms.title, ms.description, ms.template_id, ms.css_class,
           ms.custom_css, ms.max_depth, ms.show_icons, ms.show_badges, ms.responsive,
           ms.visible_for_levels, ms.is_active, ms.is_system, ms.created_at, ms.updated_at,
           ms.created_by, mt.title as template_title, mt.name as template_name
    FROM cms_menu_sets ms
    LEFT JOIN cms_menu_templates mt ON ms.template_id = mt.id
    WHERE ms.name = $1
    """

    case Connection.query(sql, [name]) do
      {:ok, %{rows: [row]}} ->
        menu_set = row_to_menu_set(row)
        {:ok, menu_set}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo conjunto de menu.
  """
  def create_menu_set(attrs) do
    case MenuSet.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO cms_menu_sets (
          name, title, description, template_id, css_class, custom_css, max_depth,
          show_icons, show_badges, responsive, visible_for_levels, is_active, is_system,
          created_at, updated_at, created_by
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16
        ) RETURNING id
        """

        params = [
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:template_id] || 1,
          validated_attrs[:css_class] || "",
          validated_attrs[:custom_css] || "",
          validated_attrs[:max_depth] || 3,
          validated_attrs[:show_icons] || true,
          validated_attrs[:show_badges] || true,
          validated_attrs[:responsive] || true,
          validated_attrs[:visible_for_levels] || 2147483647,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_system] || false,
          now,
          now,
          validated_attrs[:created_by]
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_menu_set(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza um conjunto de menu.
  """
  def update_menu_set(id, attrs) do
    case MenuSet.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        UPDATE cms_menu_sets SET
          name = $2, title = $3, description = $4, template_id = $5, css_class = $6,
          custom_css = $7, max_depth = $8, show_icons = $9, show_badges = $10,
          responsive = $11, visible_for_levels = $12, is_active = $13, is_system = $14,
          updated_at = $15, created_by = $16
        WHERE id = $1
        """

        params = [
          id,
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:template_id] || 1,
          validated_attrs[:css_class] || "",
          validated_attrs[:custom_css] || "",
          validated_attrs[:max_depth] || 3,
          validated_attrs[:show_icons] || true,
          validated_attrs[:show_badges] || true,
          validated_attrs[:responsive] || true,
          validated_attrs[:visible_for_levels] || 2147483647,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_system] || false,
          now,
          validated_attrs[:created_by]
        ]

        case Connection.query(sql, params) do
          {:ok, _} ->
            get_menu_set(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Deleta um conjunto de menu.
  """
  def delete_menu_set(id) do
    sql = "DELETE FROM cms_menu_sets WHERE id = $1 AND is_system = false"

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
  # MENU TEMPLATES
  # ============================================================================

  @doc """
  Lista todos os templates de menu.
  """
  def list_menu_templates do
    sql = """
    SELECT id, name, title, description, template_file, css_class, js_file,
           supports_icons, supports_badges, supports_dropdown, supports_mega_menu,
           max_levels, is_responsive, mobile_breakpoint, is_active, is_system,
           created_at, order_index
    FROM cms_menu_templates
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        templates = Enum.map(rows, &row_to_menu_template/1)
        {:ok, templates}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca template por ID.
  """
  def get_menu_template(id) do
    sql = """
    SELECT id, name, title, description, template_file, css_class, js_file,
           supports_icons, supports_badges, supports_dropdown, supports_mega_menu,
           max_levels, is_responsive, mobile_breakpoint, is_active, is_system,
           created_at, order_index
    FROM cms_menu_templates
    WHERE id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        template = row_to_menu_template(row)
        {:ok, template}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # MENU ITEMS
  # ============================================================================

  @doc """
  Lista itens de um conjunto de menu.
  """
  def list_menu_items(menu_set_id) do
    sql = """
    SELECT mi.id, mi.menu_set_id, mi.parent_id, mi.name, mi.title, mi.description,
           mi.link_type, mi.link_url, mi.page_id, mi.entity_name, mi.icon, mi.image,
           mi.css_class, mi.badge_text, mi.badge_color, mi.badge_query, mi.target,
           mi.onclick, mi.visible_for_levels, mi.submenu_template, mi.mega_menu_content,
           mi.is_active, mi.is_separator, mi.order_index, mi.created_at, mi.updated_at,
           p.title as page_title
    FROM cms_menu_items mi
    LEFT JOIN cms_pages p ON mi.page_id = p.id
    WHERE mi.menu_set_id = $1
    ORDER BY mi.parent_id ASC, mi.order_index ASC, mi.title ASC
    """

    case Connection.query(sql, [menu_set_id]) do
      {:ok, %{rows: rows}} ->
        items = Enum.map(rows, &row_to_menu_item/1)
        {:ok, items}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_menu_set([id, name, title, description, template_id, css_class,
                        custom_css, max_depth, show_icons, show_badges, responsive,
                        visible_for_levels, is_active, is_system, created_at, updated_at,
                        created_by, template_title, template_name]) do
    MenuSet.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      template_id: template_id,
      css_class: css_class,
      custom_css: custom_css,
      max_depth: max_depth,
      show_icons: show_icons,
      show_badges: show_badges,
      responsive: responsive,
      visible_for_levels: visible_for_levels,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      updated_at: updated_at,
      created_by: created_by,
      template_title: template_title,
      template_name: template_name
    })
  end

  defp row_to_menu_template([id, name, title, description, template_file, css_class, js_file,
                             supports_icons, supports_badges, supports_dropdown, supports_mega_menu,
                             max_levels, is_responsive, mobile_breakpoint, is_active, is_system,
                             created_at, order_index]) do
    MenuTemplate.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      template_file: template_file,
      css_class: css_class,
      js_file: js_file,
      supports_icons: supports_icons,
      supports_badges: supports_badges,
      supports_dropdown: supports_dropdown,
      supports_mega_menu: supports_mega_menu,
      max_levels: max_levels,
      is_responsive: is_responsive,
      mobile_breakpoint: mobile_breakpoint,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      order_index: order_index
    })
  end

  defp row_to_menu_item([id, menu_set_id, parent_id, name, title, description,
                         link_type, link_url, page_id, entity_name, icon, image,
                         css_class, badge_text, badge_color, badge_query, target,
                         onclick, visible_for_levels, submenu_template, mega_menu_content,
                         is_active, is_separator, order_index, created_at, updated_at,
                         page_title]) do
    MenuItem.new(%{
      id: id,
      menu_set_id: menu_set_id,
      parent_id: parent_id,
      name: name,
      title: title,
      description: description,
      link_type: link_type,
      link_url: link_url,
      page_id: page_id,
      entity_name: entity_name,
      icon: icon,
      image: image,
      css_class: css_class,
      badge_text: badge_text,
      badge_color: badge_color,
      badge_query: badge_query,
      target: target,
      onclick: onclick,
      visible_for_levels: visible_for_levels,
      submenu_template: submenu_template,
      mega_menu_content: mega_menu_content,
      is_active: is_active,
      is_separator: is_separator,
      order_index: order_index,
      created_at: created_at,
      updated_at: updated_at,
      page_title: page_title
    })
  end
end
