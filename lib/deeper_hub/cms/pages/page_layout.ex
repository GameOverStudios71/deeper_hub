defmodule DeeperHub.CMS.Pages.PageLayout do
  @moduledoc """
  Schema para layouts de página do sistema usando db_connection.
  Representa layouts que definem a estrutura das páginas.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_page_layouts"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para layouts de página.
  """
  defstruct [
    :id, :name, :title, :description, :template, :icon, :cells_number,
    :cells_config, :is_active, :is_system, :created_at, :updated_at, :order_index
  ]

  @doc """
  Valida dados do layout.
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

    # Validação do template
    template = attrs[:template] || attrs["template"]
    errors = if not is_binary(template) or String.length(template) < 1 do
      ["template é obrigatório" | errors]
    else
      errors
    end

    # Validação do cells_number
    cells_number = attrs[:cells_number] || attrs["cells_number"]
    errors = if cells_number && (not is_integer(cells_number) or cells_number < 1) do
      ["cells_number deve ser um número inteiro maior que 0" | errors]
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
  Cria um novo layout com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      template: attrs[:template],
      icon: attrs[:icon] || "",
      cells_number: attrs[:cells_number] || 1,
      cells_config: attrs[:cells_config] || "",
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      order_index: attrs[:order_index] || 0
    }
  end

  @doc """
  Verifica se o layout está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o layout é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Retorna o número de células do layout.
  """
  def cells_count(%__MODULE__{cells_number: count}), do: count

  @doc """
  Retorna a configuração das células como mapa.
  """
  def cells_configuration(%__MODULE__{cells_config: config}) when is_binary(config) and config != "" do
    case Jason.decode(config) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def cells_configuration(_), do: %{}

  @doc """
  Verifica se o layout tem ícone.
  """
  def has_icon?(%__MODULE__{icon: icon}) do
    is_binary(icon) and icon != ""
  end

  @doc """
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template: template}, base_path \\ "templates/layouts/") do
    if String.starts_with?(template, "/") do
      template
    else
      Path.join(base_path, template)
    end
  end

  @doc """
  Verifica se é um layout de coluna única.
  """
  def single_column?(%__MODULE__{cells_number: 1}), do: true
  def single_column?(_), do: false

  @doc """
  Verifica se é um layout de múltiplas colunas.
  """
  def multi_column?(%__MODULE__{cells_number: count}) when count > 1, do: true
  def multi_column?(_), do: false

  @doc """
  Retorna informações resumidas do layout.
  """
  def summary(%__MODULE__{} = layout) do
    %{
      id: layout.id,
      name: layout.name,
      title: layout.title,
      cells_number: layout.cells_number,
      is_active: layout.is_active,
      is_system: layout.is_system,
      has_icon: has_icon?(layout)
    }
  end

  @doc """
  Gera CSS classes baseadas na configuração das células.
  """
  def generate_css_classes(%__MODULE__{} = layout) do
    config = cells_configuration(layout)
    
    case config do
      %{"cells" => cells} when is_list(cells) ->
        Enum.map(cells, fn cell ->
          Map.get(cell, "class", "col")
        end)
      _ ->
        # Fallback para layouts sem configuração específica
        case layout.cells_number do
          1 -> ["col-12"]
          2 -> ["col-6", "col-6"]
          3 -> ["col-4", "col-4", "col-4"]
          4 -> ["col-3", "col-3", "col-3", "col-3"]
          _ -> ["col"]
        end
    end
  end

  @doc """
  Verifica se o layout é responsivo baseado na configuração.
  """
  def responsive?(%__MODULE__{} = layout) do
    config = cells_configuration(layout)
    
    case config do
      %{"responsive" => responsive} -> responsive
      %{"cells" => cells} when is_list(cells) ->
        # Verifica se alguma célula tem classes responsivas
        Enum.any?(cells, fn cell ->
          class = Map.get(cell, "class", "")
          String.contains?(class, ["col-sm", "col-md", "col-lg", "col-xl"])
        end)
      _ -> true # Assume responsivo por padrão
    end
  end
end
