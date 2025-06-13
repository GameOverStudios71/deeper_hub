defmodule DeeperHub.CMS.Menus.MenuSet do
  @moduledoc """
  Schema para conjuntos de menu do sistema usando db_connection.
  Representa grupos de menus com configurações específicas.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_menu_sets"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para conjuntos de menu.
  """
  defstruct [
    :id, :name, :title, :description, :template_id, :css_class, :custom_css,
    :max_depth, :show_icons, :show_badges, :responsive, :visible_for_levels,
    :is_active, :is_system, :created_at, :updated_at, :created_by,
    :template_title, :template_name
  ]

  @doc """
  Valida dados do conjunto de menu.
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

    # Validação do template_id
    template_id = attrs[:template_id] || attrs["template_id"]
    errors = if template_id && (not is_integer(template_id) or template_id <= 0) do
      ["template_id deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do max_depth
    max_depth = attrs[:max_depth] || attrs["max_depth"]
    errors = if max_depth && (not is_integer(max_depth) or max_depth < 1 or max_depth > 10) do
      ["max_depth deve ser um número entre 1 e 10" | errors]
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
  Cria um novo conjunto de menu com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      template_id: attrs[:template_id] || 1,
      css_class: attrs[:css_class] || "",
      custom_css: attrs[:custom_css] || "",
      max_depth: attrs[:max_depth] || 3,
      show_icons: attrs[:show_icons] || true,
      show_badges: attrs[:show_badges] || true,
      responsive: attrs[:responsive] || true,
      visible_for_levels: attrs[:visible_for_levels] || 2147483647,
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      created_by: attrs[:created_by],
      template_title: attrs[:template_title],
      template_name: attrs[:template_name]
    }
  end

  @doc """
  Verifica se o conjunto está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o conjunto é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Verifica se mostra ícones.
  """
  def show_icons?(%__MODULE__{show_icons: true}), do: true
  def show_icons?(_), do: false

  @doc """
  Verifica se mostra badges.
  """
  def show_badges?(%__MODULE__{show_badges: true}), do: true
  def show_badges?(_), do: false

  @doc """
  Verifica se é responsivo.
  """
  def responsive?(%__MODULE__{responsive: true}), do: true
  def responsive?(_), do: false

  @doc """
  Verifica se tem CSS customizado.
  """
  def has_custom_css?(%__MODULE__{custom_css: css}) do
    is_binary(css) and String.trim(css) != ""
  end

  @doc """
  Verifica se tem classes CSS.
  """
  def has_css_class?(%__MODULE__{css_class: css_class}) do
    is_binary(css_class) and String.trim(css_class) != ""
  end

  @doc """
  Retorna as classes CSS como lista.
  """
  def css_classes(%__MODULE__{css_class: css_class}) when is_binary(css_class) and css_class != "" do
    css_class
    |> String.split(" ")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end
  def css_classes(_), do: []

  @doc """
  Verifica se é um menu principal.
  """
  def main_menu?(%__MODULE__{name: "main_menu"}), do: true
  def main_menu?(_), do: false

  @doc """
  Verifica se é um menu de rodapé.
  """
  def footer_menu?(%__MODULE__{name: "footer_menu"}), do: true
  def footer_menu?(_), do: false

  @doc """
  Verifica se é um menu lateral.
  """
  def sidebar_menu?(%__MODULE__{name: "sidebar_menu"}), do: true
  def sidebar_menu?(_), do: false

  @doc """
  Verifica se é um menu administrativo.
  """
  def admin_menu?(%__MODULE__{name: "admin_menu"}), do: true
  def admin_menu?(_), do: false

  @doc """
  Verifica se é um menu de usuário.
  """
  def user_menu?(%__MODULE__{name: "user_menu"}), do: true
  def user_menu?(_), do: false

  @doc """
  Verifica se permite múltiplos níveis.
  """
  def multi_level?(%__MODULE__{max_depth: depth}) when depth > 1, do: true
  def multi_level?(_), do: false

  @doc """
  Verifica se é um menu simples (1 nível).
  """
  def simple_menu?(%__MODULE__{max_depth: 1}), do: true
  def simple_menu?(_), do: false

  @doc """
  Retorna informações de configuração do menu.
  """
  def configuration_info(%__MODULE__{} = menu_set) do
    %{
      max_depth: menu_set.max_depth,
      show_icons: show_icons?(menu_set),
      show_badges: show_badges?(menu_set),
      responsive: responsive?(menu_set),
      has_custom_css: has_custom_css?(menu_set),
      has_css_class: has_css_class?(menu_set),
      is_multi_level: multi_level?(menu_set),
      template_id: menu_set.template_id,
      template_name: menu_set.template_name
    }
  end

  @doc """
  Retorna características baseadas no tipo de menu.
  """
  def menu_characteristics(%__MODULE__{name: name}) do
    case name do
      "main_menu" ->
        %{
          position: "header",
          typical_depth: 3,
          supports_mega_menu: true,
          responsive_priority: :high,
          seo_important: true
        }
      "footer_menu" ->
        %{
          position: "footer",
          typical_depth: 2,
          supports_mega_menu: false,
          responsive_priority: :low,
          seo_important: false
        }
      "sidebar_menu" ->
        %{
          position: "sidebar",
          typical_depth: 4,
          supports_mega_menu: false,
          responsive_priority: :medium,
          seo_important: false
        }
      "admin_menu" ->
        %{
          position: "admin",
          typical_depth: 3,
          supports_mega_menu: false,
          responsive_priority: :high,
          seo_important: false
        }
      "user_menu" ->
        %{
          position: "user",
          typical_depth: 2,
          supports_mega_menu: false,
          responsive_priority: :medium,
          seo_important: false
        }
      _ ->
        %{
          position: "custom",
          typical_depth: 3,
          supports_mega_menu: false,
          responsive_priority: :medium,
          seo_important: false
        }
    end
  end

  @doc """
  Retorna informações resumidas do conjunto.
  """
  def summary(%__MODULE__{} = menu_set) do
    %{
      id: menu_set.id,
      name: menu_set.name,
      title: menu_set.title,
      template_id: menu_set.template_id,
      template_name: menu_set.template_name,
      is_active: menu_set.is_active,
      is_system: menu_set.is_system,
      max_depth: menu_set.max_depth,
      show_icons: menu_set.show_icons,
      show_badges: menu_set.show_badges,
      responsive: menu_set.responsive,
      has_custom_css: has_custom_css?(menu_set),
      is_multi_level: multi_level?(menu_set),
      menu_type: get_menu_type(menu_set.name)
    }
  end

  @doc """
  Retorna sugestões de configuração baseadas no tipo.
  """
  def configuration_suggestions(%__MODULE__{name: name}) do
    case name do
      "main_menu" ->
        [
          "Configure profundidade máxima de 3 níveis",
          "Habilite ícones para melhor UX",
          "Use template responsivo",
          "Configure mega menu se necessário"
        ]
      "footer_menu" ->
        [
          "Mantenha simples com 2 níveis",
          "Desabilite badges para visual limpo",
          "Use links diretos",
          "Agrupe por categorias"
        ]
      "sidebar_menu" ->
        [
          "Permita até 4 níveis de profundidade",
          "Use ícones para identificação rápida",
          "Configure accordion se necessário",
          "Mantenha sempre visível"
        ]
      "admin_menu" ->
        [
          "Organize por funcionalidades",
          "Use ícones consistentes",
          "Configure permissões adequadas",
          "Mantenha estrutura lógica"
        ]
      "user_menu" ->
        [
          "Mantenha simples e direto",
          "Use dropdown compacto",
          "Inclua logout sempre visível",
          "Configure para mobile"
        ]
      _ ->
        [
          "Defina propósito claro",
          "Configure profundidade adequada",
          "Teste responsividade",
          "Valide acessibilidade"
        ]
    end
  end

  @doc """
  Verifica se o menu suporta mega menu.
  """
  def supports_mega_menu?(%__MODULE__{} = menu_set) do
    characteristics = menu_characteristics(menu_set)
    characteristics.supports_mega_menu
  end

  @doc """
  Verifica se é importante para SEO.
  """
  def seo_important?(%__MODULE__{} = menu_set) do
    characteristics = menu_characteristics(menu_set)
    characteristics.seo_important
  end

  @doc """
  Retorna a prioridade responsiva.
  """
  def responsive_priority(%__MODULE__{} = menu_set) do
    characteristics = menu_characteristics(menu_set)
    characteristics.responsive_priority
  end

  # Função auxiliar privada
  defp get_menu_type(name) do
    case name do
      "main_menu" -> :main
      "footer_menu" -> :footer
      "sidebar_menu" -> :sidebar
      "admin_menu" -> :admin
      "user_menu" -> :user
      _ -> :custom
    end
  end
end
