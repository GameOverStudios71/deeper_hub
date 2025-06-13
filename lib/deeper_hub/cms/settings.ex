defmodule DeeperHub.CMS.Settings do
  @moduledoc """
  Contexto para gerenciar configurações do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Settings.Theme

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
end
