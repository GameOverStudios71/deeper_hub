defmodule DeeperHub.CMS.Settings.Theme do
  @moduledoc """
  Schema para temas do sistema usando db_connection.
  Representa temas visuais com configurações específicas.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_themes"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para temas.
  """
  defstruct [
    :id, :name, :title, :description, :template_path, :css_file, :js_file,
    :preview_image, :version, :author, :author_url, :supports_dark_mode,
    :is_responsive, :min_width, :is_active, :is_default, :is_system,
    :order_index, :created_at, :updated_at
  ]

  @doc """
  Valida dados do tema.
  """
  def validate(attrs) do
    errors = []

    # Converte chaves string para atom se necessário
    attrs = case attrs do
      %{} = map when is_map(map) ->
        for {key, value} <- map, into: %{} do
          key_atom = if is_binary(key), do: String.to_atom(key), else: key
          {key_atom, value}
        end
      _ -> attrs
    end

    # Validação do name
    name = attrs[:name] || attrs["name"]
    errors = if not is_binary(name) or String.length(name) < 2 do
      ["name é obrigatório e deve ter pelo menos 2 caracteres" | errors]
    else
      errors
    end

    # Validação do title
    title = attrs[:title] || attrs["title"]
    errors = if not is_binary(title) or String.length(title) < 2 do
      ["title é obrigatório e deve ter pelo menos 2 caracteres" | errors]
    else
      errors
    end

    # Validação do template_path
    template_path = attrs[:template_path] || attrs["template_path"]
    errors = if not is_binary(template_path) or String.length(template_path) < 1 do
      ["template_path é obrigatório" | errors]
    else
      errors
    end

    if length(errors) == 0 do
      {:ok, attrs}
    else
      {:error, errors}
    end
  end

  @doc """
  Cria um novo tema com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      template_path: attrs[:template_path],
      css_file: attrs[:css_file] || "",
      js_file: attrs[:js_file] || "",
      preview_image: attrs[:preview_image] || "",
      version: attrs[:version] || "1.0.0",
      author: attrs[:author] || "",
      author_url: attrs[:author_url] || "",
      supports_dark_mode: attrs[:supports_dark_mode] || false,
      is_responsive: attrs[:is_responsive] || true,
      min_width: attrs[:min_width] || 320,
      is_active: attrs[:is_active] || true,
      is_default: attrs[:is_default] || false,
      is_system: attrs[:is_system] || false,
      order_index: attrs[:order_index] || 0,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  @doc """
  Verifica se o tema é padrão.
  """
  def default?(%__MODULE__{is_default: true}), do: true
  def default?(_), do: false

  @doc """
  Verifica se o tema é responsivo.
  """
  def responsive?(%__MODULE__{is_responsive: true}), do: true
  def responsive?(_), do: false

  @doc """
  Verifica se o tema suporta modo escuro.
  """
  def supports_dark_mode?(%__MODULE__{supports_dark_mode: true}), do: true
  def supports_dark_mode?(_), do: false

  @doc """
  Verifica se o tema tem arquivo CSS.
  """
  def has_css_file?(%__MODULE__{css_file: file}) do
    is_binary(file) and file != ""
  end

  @doc """
  Verifica se o tema tem arquivo JS.
  """
  def has_js_file?(%__MODULE__{js_file: file}) do
    is_binary(file) and file != ""
  end

  @doc """
  Verifica se o tema tem imagem de preview.
  """
  def has_preview_image?(%__MODULE__{preview_image: image}) do
    is_binary(image) and image != ""
  end

  @doc """
  Retorna o caminho completo do CSS.
  """
  def css_path(%__MODULE__{template_path: path, css_file: css}) when is_binary(css) and css != "" do
    Path.join(path, css)
  end
  def css_path(_), do: nil

  @doc """
  Retorna o caminho completo do JS.
  """
  def js_path(%__MODULE__{template_path: path, js_file: js}) when is_binary(js) and js != "" do
    Path.join(path, js)
  end
  def js_path(_), do: nil

  @doc """
  Retorna informações do autor como mapa.
  """
  def author_info(%__MODULE__{author: author, author_url: url}) do
    %{
      name: author,
      url: if(url != "", do: url, else: nil)
    }
  end
end
