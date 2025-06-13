defmodule DeeperHub.CMS.Menus.MenuTemplate do
  @moduledoc """
  Schema para templates de menu do sistema usando db_connection.
  Representa diferentes estilos visuais de menu.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_menu_templates"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para templates de menu.
  """
  defstruct [
    :id, :name, :title, :description, :template_file, :css_class, :js_file,
    :supports_icons, :supports_badges, :supports_dropdown, :supports_mega_menu,
    :max_levels, :is_responsive, :mobile_breakpoint, :is_active, :is_system,
    :created_at, :order_index
  ]

  @doc """
  Valida dados do template.
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

    # Validação do template_file
    template_file = attrs[:template_file] || attrs["template_file"]
    errors = if not is_binary(template_file) or String.length(template_file) < 1 do
      ["template_file é obrigatório" | errors]
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
  Cria um novo template com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      template_file: attrs[:template_file],
      css_class: attrs[:css_class] || "",
      js_file: attrs[:js_file] || "",
      supports_icons: attrs[:supports_icons] || true,
      supports_badges: attrs[:supports_badges] || true,
      supports_dropdown: attrs[:supports_dropdown] || true,
      supports_mega_menu: attrs[:supports_mega_menu] || false,
      max_levels: attrs[:max_levels] || 3,
      is_responsive: attrs[:is_responsive] || true,
      mobile_breakpoint: attrs[:mobile_breakpoint] || 768,
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      order_index: attrs[:order_index] || 0
    }
  end

  @doc """
  Verifica se o template está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o template é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Verifica se suporta ícones.
  """
  def supports_icons?(%__MODULE__{supports_icons: true}), do: true
  def supports_icons?(_), do: false

  @doc """
  Verifica se suporta badges.
  """
  def supports_badges?(%__MODULE__{supports_badges: true}), do: true
  def supports_badges?(_), do: false

  @doc """
  Verifica se suporta dropdown.
  """
  def supports_dropdown?(%__MODULE__{supports_dropdown: true}), do: true
  def supports_dropdown?(_), do: false

  @doc """
  Verifica se suporta mega menu.
  """
  def supports_mega_menu?(%__MODULE__{supports_mega_menu: true}), do: true
  def supports_mega_menu?(_), do: false

  @doc """
  Verifica se é responsivo.
  """
  def responsive?(%__MODULE__{is_responsive: true}), do: true
  def responsive?(_), do: false

  @doc """
  Verifica se tem arquivo JavaScript.
  """
  def has_js_file?(%__MODULE__{js_file: js}) do
    is_binary(js) and String.trim(js) != ""
  end

  @doc """
  Verifica se tem classes CSS.
  """
  def has_css_class?(%__MODULE__{css_class: css_class}) do
    is_binary(css_class) and String.trim(css_class) != ""
  end

  @doc """
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template_file: file}, base_path \\ "templates/menus/") do
    cond do
      file == "" ->
        Path.join(base_path, "default.html")
      String.starts_with?(file, "/") ->
        file
      true ->
        Path.join(base_path, file)
    end
  end

  @doc """
  Retorna o caminho completo do arquivo JS.
  """
  def js_path(%__MODULE__{js_file: file}, base_path \\ "assets/js/menus/") do
    cond do
      file == "" ->
        nil
      String.starts_with?(file, "/") ->
        file
      true ->
        Path.join(base_path, file)
    end
  end

  @doc """
  Verifica se é template horizontal.
  """
  def horizontal?(%__MODULE__{name: "horizontal"}), do: true
  def horizontal?(_), do: false

  @doc """
  Verifica se é template vertical.
  """
  def vertical?(%__MODULE__{name: "vertical"}), do: true
  def vertical?(_), do: false

  @doc """
  Verifica se é template dropdown.
  """
  def dropdown?(%__MODULE__{name: "dropdown"}), do: true
  def dropdown?(_), do: false

  @doc """
  Verifica se é template mega menu.
  """
  def mega_menu?(%__MODULE__{name: "mega_menu"}), do: true
  def mega_menu?(_), do: false

  @doc """
  Verifica se é template breadcrumb.
  """
  def breadcrumb?(%__MODULE__{name: "breadcrumb"}), do: true
  def breadcrumb?(_), do: false

  @doc """
  Verifica se é template de abas.
  """
  def tabs?(%__MODULE__{name: "tabs"}), do: true
  def tabs?(_), do: false

  @doc """
  Verifica se é template accordion.
  """
  def accordion?(%__MODULE__{name: "accordion"}), do: true
  def accordion?(_), do: false

  @doc """
  Retorna características do template.
  """
  def characteristics(%__MODULE__{name: name} = template) do
    base_characteristics = %{
      supports_icons: supports_icons?(template),
      supports_badges: supports_badges?(template),
      supports_dropdown: supports_dropdown?(template),
      supports_mega_menu: supports_mega_menu?(template),
      max_levels: template.max_levels,
      is_responsive: responsive?(template),
      mobile_breakpoint: template.mobile_breakpoint,
      has_js: has_js_file?(template)
    }

    type_specific = case name do
      "horizontal" ->
        %{
          orientation: :horizontal,
          best_for: ["main navigation", "header menus"],
          mobile_behavior: :collapse,
          typical_position: :top
        }
      "vertical" ->
        %{
          orientation: :vertical,
          best_for: ["sidebar navigation", "admin panels"],
          mobile_behavior: :stack,
          typical_position: :side
        }
      "dropdown" ->
        %{
          orientation: :horizontal,
          best_for: ["compact navigation", "user menus"],
          mobile_behavior: :dropdown,
          typical_position: :top
        }
      "mega_menu" ->
        %{
          orientation: :horizontal,
          best_for: ["e-commerce", "content-rich sites"],
          mobile_behavior: :accordion,
          typical_position: :top
        }
      "breadcrumb" ->
        %{
          orientation: :horizontal,
          best_for: ["navigation trail", "deep hierarchies"],
          mobile_behavior: :scroll,
          typical_position: :content
        }
      "tabs" ->
        %{
          orientation: :horizontal,
          best_for: ["content sections", "filters"],
          mobile_behavior: :scroll,
          typical_position: :content
        }
      "accordion" ->
        %{
          orientation: :vertical,
          best_for: ["mobile navigation", "FAQ sections"],
          mobile_behavior: :native,
          typical_position: :side
        }
      _ ->
        %{
          orientation: :horizontal,
          best_for: ["general navigation"],
          mobile_behavior: :collapse,
          typical_position: :top
        }
    end

    Map.merge(base_characteristics, type_specific)
  end

  @doc """
  Retorna informações de responsividade.
  """
  def responsive_info(%__MODULE__{} = template) do
    %{
      is_responsive: responsive?(template),
      mobile_breakpoint: template.mobile_breakpoint,
      mobile_behavior: get_mobile_behavior(template),
      supports_touch: responsive?(template)
    }
  end

  @doc """
  Retorna informações resumidas do template.
  """
  def summary(%__MODULE__{} = template) do
    characteristics = characteristics(template)
    
    %{
      id: template.id,
      name: template.name,
      title: template.title,
      is_active: template.is_active,
      is_system: template.is_system,
      supports_icons: template.supports_icons,
      supports_badges: template.supports_badges,
      supports_dropdown: template.supports_dropdown,
      supports_mega_menu: template.supports_mega_menu,
      max_levels: template.max_levels,
      is_responsive: template.is_responsive,
      has_js: has_js_file?(template),
      orientation: characteristics.orientation,
      best_for: characteristics.best_for,
      mobile_behavior: characteristics.mobile_behavior
    }
  end

  @doc """
  Retorna sugestões de uso baseadas no template.
  """
  def usage_suggestions(%__MODULE__{name: name}) do
    case name do
      "horizontal" ->
        [
          "Ideal para menu principal",
          "Configure breakpoint mobile",
          "Use com navbar responsiva",
          "Teste em diferentes resoluções"
        ]
      "vertical" ->
        [
          "Perfeito para sidebar",
          "Configure largura fixa",
          "Use ícones para economia de espaço",
          "Considere scroll interno"
        ]
      "dropdown" ->
        [
          "Ótimo para menus compactos",
          "Configure hover/click",
          "Teste acessibilidade",
          "Use indicadores visuais"
        ]
      "mega_menu" ->
        [
          "Use para sites com muito conteúdo",
          "Configure colunas adequadamente",
          "Otimize para mobile",
          "Teste performance"
        ]
      "breadcrumb" ->
        [
          "Sempre mostre caminho completo",
          "Use separadores consistentes",
          "Configure links ativos",
          "Mantenha sempre visível"
        ]
      "tabs" ->
        [
          "Limite número de abas",
          "Use indicadores de ativo",
          "Configure scroll horizontal",
          "Teste em mobile"
        ]
      "accordion" ->
        [
          "Ideal para mobile",
          "Configure animações suaves",
          "Permita múltiplos abertos",
          "Use ícones de estado"
        ]
      _ ->
        [
          "Configure conforme necessidade",
          "Teste responsividade",
          "Valide acessibilidade",
          "Otimize performance"
        ]
    end
  end

  @doc """
  Verifica compatibilidade com dispositivos móveis.
  """
  def mobile_friendly?(%__MODULE__{} = template) do
    responsive?(template) and template.mobile_breakpoint > 0
  end

  @doc """
  Retorna configurações recomendadas para o template.
  """
  def recommended_settings(%__MODULE__{name: name}) do
    case name do
      "horizontal" ->
        %{
          max_depth: 3,
          show_icons: true,
          show_badges: true,
          responsive: true,
          mobile_breakpoint: 768
        }
      "vertical" ->
        %{
          max_depth: 4,
          show_icons: true,
          show_badges: false,
          responsive: true,
          mobile_breakpoint: 768
        }
      "mega_menu" ->
        %{
          max_depth: 2,
          show_icons: true,
          show_badges: false,
          responsive: true,
          mobile_breakpoint: 992
        }
      "breadcrumb" ->
        %{
          max_depth: 10,
          show_icons: false,
          show_badges: false,
          responsive: true,
          mobile_breakpoint: 576
        }
      _ ->
        %{
          max_depth: 3,
          show_icons: true,
          show_badges: true,
          responsive: true,
          mobile_breakpoint: 768
        }
    end
  end

  # Função auxiliar privada
  defp get_mobile_behavior(%__MODULE__{name: name}) do
    characteristics = characteristics(%__MODULE__{name: name})
    characteristics.mobile_behavior
  end
end
