defmodule DeeperHub.CMS.Pages do
  @moduledoc """
  Contexto para gerenciar páginas do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Pages.Page

  # ============================================================================
  # PAGES
  # ============================================================================

  @doc """
  Lista todas as páginas.
  """
  def list_pages do
    sql = """
    SELECT p.id, p.name, p.uri, p.title_system, p.title, p.description, p.module,
           p.page_type_id, p.layout_id, p.meta_title, p.meta_description, p.meta_keywords,
           p.meta_robots, p.is_active, p.is_system, p.is_home, p.sticky_columns,
           p.cache_lifetime, p.cache_editable, p.visible_for_levels, p.visible_for_levels_editable,
           p.inject_head, p.inject_footer, p.config_api, p.custom_css, p.custom_js,
           p.author_id, p.is_deletable, p.is_editable, p.created_at, p.updated_at, p.published_at,
           pt.title as page_type_title, pl.title as layout_title
    FROM cms_pages p
    LEFT JOIN cms_page_types pt ON p.page_type_id = pt.id
    LEFT JOIN cms_page_layouts pl ON p.layout_id = pl.id
    ORDER BY p.is_home DESC, p.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        pages = Enum.map(rows, &row_to_page/1)
        {:ok, pages}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista páginas ativas.
  """
  def list_active_pages do
    sql = """
    SELECT p.id, p.name, p.uri, p.title_system, p.title, p.description, p.module,
           p.page_type_id, p.layout_id, p.meta_title, p.meta_description, p.meta_keywords,
           p.meta_robots, p.is_active, p.is_system, p.is_home, p.sticky_columns,
           p.cache_lifetime, p.cache_editable, p.visible_for_levels, p.visible_for_levels_editable,
           p.inject_head, p.inject_footer, p.config_api, p.custom_css, p.custom_js,
           p.author_id, p.is_deletable, p.is_editable, p.created_at, p.updated_at, p.published_at,
           pt.title as page_type_title, pl.title as layout_title
    FROM cms_pages p
    LEFT JOIN cms_page_types pt ON p.page_type_id = pt.id
    LEFT JOIN cms_page_layouts pl ON p.layout_id = pl.id
    WHERE p.is_active = true
    ORDER BY p.is_home DESC, p.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        pages = Enum.map(rows, &row_to_page/1)
        {:ok, pages}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca página por ID.
  """
  def get_page(id) do
    sql = """
    SELECT p.id, p.name, p.uri, p.title_system, p.title, p.description, p.module,
           p.page_type_id, p.layout_id, p.meta_title, p.meta_description, p.meta_keywords,
           p.meta_robots, p.is_active, p.is_system, p.is_home, p.sticky_columns,
           p.cache_lifetime, p.cache_editable, p.visible_for_levels, p.visible_for_levels_editable,
           p.inject_head, p.inject_footer, p.config_api, p.custom_css, p.custom_js,
           p.author_id, p.is_deletable, p.is_editable, p.created_at, p.updated_at, p.published_at,
           pt.title as page_type_title, pl.title as layout_title
    FROM cms_pages p
    LEFT JOIN cms_page_types pt ON p.page_type_id = pt.id
    LEFT JOIN cms_page_layouts pl ON p.layout_id = pl.id
    WHERE p.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        page = row_to_page(row)
        {:ok, page}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca página por URI.
  """
  def get_page_by_uri(uri) do
    sql = """
    SELECT p.id, p.name, p.uri, p.title_system, p.title, p.description, p.module,
           p.page_type_id, p.layout_id, p.meta_title, p.meta_description, p.meta_keywords,
           p.meta_robots, p.is_active, p.is_system, p.is_home, p.sticky_columns,
           p.cache_lifetime, p.cache_editable, p.visible_for_levels, p.visible_for_levels_editable,
           p.inject_head, p.inject_footer, p.config_api, p.custom_css, p.custom_js,
           p.author_id, p.is_deletable, p.is_editable, p.created_at, p.updated_at, p.published_at,
           pt.title as page_type_title, pl.title as layout_title
    FROM cms_pages p
    LEFT JOIN cms_page_types pt ON p.page_type_id = pt.id
    LEFT JOIN cms_page_layouts pl ON p.layout_id = pl.id
    WHERE p.uri = $1
    """

    case Connection.query(sql, [uri]) do
      {:ok, %{rows: [row]}} ->
        page = row_to_page(row)
        {:ok, page}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca página inicial.
  """
  def get_home_page do
    sql = """
    SELECT p.id, p.name, p.uri, p.title_system, p.title, p.description, p.module,
           p.page_type_id, p.layout_id, p.meta_title, p.meta_description, p.meta_keywords,
           p.meta_robots, p.is_active, p.is_system, p.is_home, p.sticky_columns,
           p.cache_lifetime, p.cache_editable, p.visible_for_levels, p.visible_for_levels_editable,
           p.inject_head, p.inject_footer, p.config_api, p.custom_css, p.custom_js,
           p.author_id, p.is_deletable, p.is_editable, p.created_at, p.updated_at, p.published_at,
           pt.title as page_type_title, pl.title as layout_title
    FROM cms_pages p
    LEFT JOIN cms_page_types pt ON p.page_type_id = pt.id
    LEFT JOIN cms_page_layouts pl ON p.layout_id = pl.id
    WHERE p.is_home = true AND p.is_active = true
    LIMIT 1
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: [row]}} ->
        page = row_to_page(row)
        {:ok, page}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria uma nova página.
  """
  def create_page(attrs) do
    case Page.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO cms_pages (
          name, uri, title_system, title, description, module, page_type_id, layout_id,
          meta_title, meta_description, meta_keywords, meta_robots, is_active, is_system,
          is_home, sticky_columns, cache_lifetime, cache_editable, visible_for_levels,
          visible_for_levels_editable, inject_head, inject_footer, config_api, custom_css,
          custom_js, author_id, is_deletable, is_editable, created_at, updated_at, published_at
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18,
          $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31
        ) RETURNING id
        """

        params = [
          validated_attrs[:name],
          validated_attrs[:uri],
          validated_attrs[:title_system],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:module] || "cms",
          validated_attrs[:page_type_id] || 1,
          validated_attrs[:layout_id] || 1,
          validated_attrs[:meta_title] || "",
          validated_attrs[:meta_description] || "",
          validated_attrs[:meta_keywords] || "",
          validated_attrs[:meta_robots] || "index,follow",
          validated_attrs[:is_active] || true,
          validated_attrs[:is_system] || false,
          validated_attrs[:is_home] || false,
          validated_attrs[:sticky_columns] || false,
          validated_attrs[:cache_lifetime] || 0,
          validated_attrs[:cache_editable] || true,
          validated_attrs[:visible_for_levels] || 2147483647,
          validated_attrs[:visible_for_levels_editable] || true,
          validated_attrs[:inject_head] || "",
          validated_attrs[:inject_footer] || "",
          validated_attrs[:config_api] || "",
          validated_attrs[:custom_css] || "",
          validated_attrs[:custom_js] || "",
          validated_attrs[:author_id],
          validated_attrs[:is_deletable] || true,
          validated_attrs[:is_editable] || true,
          now,
          now,
          validated_attrs[:published_at]
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_page(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza uma página.
  """
  def update_page(id, attrs) do
    case Page.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        UPDATE cms_pages SET
          name = $2, title = $3, description = $4, content = $5, layout_id = $6,
          type_id = $7, template = $8, css_class = $9, custom_css = $10, custom_js = $11,
          meta_title = $12, meta_description = $13, meta_keywords = $14, og_title = $15,
          og_description = $16, og_image = $17, canonical_url = $18, robots = $19,
          is_published = $20, is_featured = $21, is_system = $22, updated_at = $23
        WHERE id = $1
        """

        params = [
          id,
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:content] || "",
          validated_attrs[:layout_id] || 1,
          validated_attrs[:type_id] || 1,
          validated_attrs[:template] || "",
          validated_attrs[:css_class] || "",
          validated_attrs[:custom_css] || "",
          validated_attrs[:custom_js] || "",
          validated_attrs[:meta_title] || "",
          validated_attrs[:meta_description] || "",
          validated_attrs[:meta_keywords] || "",
          validated_attrs[:og_title] || "",
          validated_attrs[:og_description] || "",
          validated_attrs[:og_image] || "",
          validated_attrs[:canonical_url] || "",
          validated_attrs[:robots] || "index,follow",
          validated_attrs[:is_published] || false,
          validated_attrs[:is_featured] || false,
          validated_attrs[:is_system] || false,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, _} ->
            get_page(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Deleta uma página.
  """
  def delete_page(id) do
    sql = "DELETE FROM cms_pages WHERE id = $1 AND is_system = false"

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

  defp row_to_page([id, name, uri, title_system, title, description, module,
                    page_type_id, layout_id, meta_title, meta_description, meta_keywords,
                    meta_robots, is_active, is_system, is_home, sticky_columns,
                    cache_lifetime, cache_editable, visible_for_levels, visible_for_levels_editable,
                    inject_head, inject_footer, config_api, custom_css, custom_js,
                    author_id, is_deletable, is_editable, created_at, updated_at, published_at,
                    page_type_title, layout_title]) do
    Page.new(%{
      id: id,
      name: name,
      uri: uri,
      title_system: title_system,
      title: title,
      description: description,
      module: module,
      page_type_id: page_type_id,
      layout_id: layout_id,
      meta_title: meta_title,
      meta_description: meta_description,
      meta_keywords: meta_keywords,
      meta_robots: meta_robots,
      is_active: is_active,
      is_system: is_system,
      is_home: is_home,
      sticky_columns: sticky_columns,
      cache_lifetime: cache_lifetime,
      cache_editable: cache_editable,
      visible_for_levels: visible_for_levels,
      visible_for_levels_editable: visible_for_levels_editable,
      inject_head: inject_head,
      inject_footer: inject_footer,
      config_api: config_api,
      custom_css: custom_css,
      custom_js: custom_js,
      author_id: author_id,
      is_deletable: is_deletable,
      is_editable: is_editable,
      created_at: created_at,
      updated_at: updated_at,
      published_at: published_at,
      page_type_title: page_type_title,
      layout_title: layout_title
    })
  end
end
