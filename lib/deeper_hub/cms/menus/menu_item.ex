defmodule DeeperHub.CMS.Menus.MenuItem do
  @moduledoc """
  Schema para itens de menu do sistema usando db_connection.
  Representa itens individuais dentro de conjuntos de menu.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_menu_items"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para itens de menu.
  """
  defstruct [
    :id, :menu_set_id, :parent_id, :name, :title, :description, :link_type,
    :link_url, :page_id, :entity_name, :icon, :image, :css_class, :badge_text,
    :badge_color, :badge_query, :target, :onclick, :visible_for_levels,
    :submenu_template, :mega_menu_content, :is_active, :is_separator,
    :order_index, :created_at, :updated_at, :page_title
  ]

  @doc """
  Valida dados do item de menu.
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

    # Validação do menu_set_id
    menu_set_id = attrs[:menu_set_id] || attrs["menu_set_id"]
    errors = if not is_integer(menu_set_id) or menu_set_id <= 0 do
      ["menu_set_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do name
    name = attrs[:name] || attrs["name"]
    errors = if not is_binary(name) or String.length(name) < 1 do
      ["name é obrigatório" | errors]
    else
      errors
    end

    # Validação do title
    title = attrs[:title] || attrs["title"]
    errors = if not is_binary(title) or String.length(title) < 1 do
      ["title é obrigatório" | errors]
    else
      errors
    end

    # Validação do link_type
    link_type = attrs[:link_type] || attrs["link_type"]
    valid_link_types = ["url", "page", "entity", "action", "separator"]
    errors = if link_type && not Enum.member?(valid_link_types, link_type) do
      ["link_type deve ser um dos seguintes: #{Enum.join(valid_link_types, ", ")}" | errors]
    else
      errors
    end

    # Validação do target
    target = attrs[:target] || attrs["target"]
    valid_targets = ["_self", "_blank", "_parent", "_top"]
    errors = if target && not Enum.member?(valid_targets, target) do
      ["target deve ser um dos seguintes: #{Enum.join(valid_targets, ", ")}" | errors]
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
  Cria um novo item de menu com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      menu_set_id: attrs[:menu_set_id],
      parent_id: attrs[:parent_id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      link_type: attrs[:link_type] || "url",
      link_url: attrs[:link_url] || "",
      page_id: attrs[:page_id],
      entity_name: attrs[:entity_name] || "",
      icon: attrs[:icon] || "",
      image: attrs[:image] || "",
      css_class: attrs[:css_class] || "",
      badge_text: attrs[:badge_text] || "",
      badge_color: attrs[:badge_color] || "",
      badge_query: attrs[:badge_query] || "",
      target: attrs[:target] || "_self",
      onclick: attrs[:onclick] || "",
      visible_for_levels: attrs[:visible_for_levels] || 2147483647,
      submenu_template: attrs[:submenu_template] || "",
      mega_menu_content: attrs[:mega_menu_content] || "",
      is_active: attrs[:is_active] || true,
      is_separator: attrs[:is_separator] || false,
      order_index: attrs[:order_index] || 0,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      page_title: attrs[:page_title]
    }
  end

  @doc """
  Verifica se o item está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se é um separador.
  """
  def separator?(%__MODULE__{is_separator: true}), do: true
  def separator?(_), do: false

  @doc """
  Verifica se tem ícone.
  """
  def has_icon?(%__MODULE__{icon: icon}) do
    is_binary(icon) and String.trim(icon) != ""
  end

  @doc """
  Verifica se tem imagem.
  """
  def has_image?(%__MODULE__{image: image}) do
    is_binary(image) and String.trim(image) != ""
  end

  @doc """
  Verifica se tem badge.
  """
  def has_badge?(%__MODULE__{badge_text: text}) do
    is_binary(text) and String.trim(text) != ""
  end

  @doc """
  Verifica se tem badge dinâmico (query).
  """
  def has_dynamic_badge?(%__MODULE__{badge_query: query}) do
    is_binary(query) and String.trim(query) != ""
  end

  @doc """
  Verifica se tem onclick.
  """
  def has_onclick?(%__MODULE__{onclick: onclick}) do
    is_binary(onclick) and String.trim(onclick) != ""
  end

  @doc """
  Verifica se tem submenu template customizado.
  """
  def has_custom_submenu_template?(%__MODULE__{submenu_template: template}) do
    is_binary(template) and String.trim(template) != ""
  end

  @doc """
  Verifica se tem conteúdo de mega menu.
  """
  def has_mega_menu_content?(%__MODULE__{mega_menu_content: content}) do
    is_binary(content) and String.trim(content) != ""
  end

  @doc """
  Verifica se é um item raiz (sem pai).
  """
  def root_item?(%__MODULE__{parent_id: nil}), do: true
  def root_item?(_), do: false

  @doc """
  Verifica se é um subitem.
  """
  def sub_item?(%__MODULE__{parent_id: parent_id}) when is_integer(parent_id), do: true
  def sub_item?(_), do: false

  @doc """
  Verifica se é link para URL.
  """
  def url_link?(%__MODULE__{link_type: "url"}), do: true
  def url_link?(_), do: false

  @doc """
  Verifica se é link para página.
  """
  def page_link?(%__MODULE__{link_type: "page"}), do: true
  def page_link?(_), do: false

  @doc """
  Verifica se é link para entidade.
  """
  def entity_link?(%__MODULE__{link_type: "entity"}), do: true
  def entity_link?(_), do: false

  @doc """
  Verifica se é ação.
  """
  def action_link?(%__MODULE__{link_type: "action"}), do: true
  def action_link?(_), do: false

  @doc """
  Verifica se abre em nova janela.
  """
  def opens_new_window?(%__MODULE__{target: "_blank"}), do: true
  def opens_new_window?(_), do: false

  @doc """
  Retorna o URL efetivo do item.
  """
  def effective_url(%__MODULE__{link_type: "url", link_url: url}), do: url
  def effective_url(%__MODULE__{link_type: "page", page_id: page_id}) when is_integer(page_id) do
    "/page/#{page_id}"
  end
  def effective_url(%__MODULE__{link_type: "entity", entity_name: entity}) when is_binary(entity) and entity != "" do
    "/#{entity}"
  end
  def effective_url(%__MODULE__{link_type: "action", link_url: action}), do: action
  def effective_url(_), do: "#"

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
  Retorna informações do badge.
  """
  def badge_info(%__MODULE__{} = item) do
    %{
      has_badge: has_badge?(item),
      has_dynamic_badge: has_dynamic_badge?(item),
      text: item.badge_text,
      color: item.badge_color,
      query: item.badge_query
    }
  end

  @doc """
  Retorna informações de link.
  """
  def link_info(%__MODULE__{} = item) do
    %{
      type: item.link_type,
      url: effective_url(item),
      target: item.target,
      opens_new_window: opens_new_window?(item),
      has_onclick: has_onclick?(item),
      onclick: item.onclick
    }
  end

  @doc """
  Retorna informações visuais.
  """
  def visual_info(%__MODULE__{} = item) do
    %{
      has_icon: has_icon?(item),
      icon: item.icon,
      has_image: has_image?(item),
      image: item.image,
      css_classes: css_classes(item),
      has_custom_submenu: has_custom_submenu_template?(item),
      has_mega_menu: has_mega_menu_content?(item)
    }
  end

  @doc """
  Retorna informações resumidas do item.
  """
  def summary(%__MODULE__{} = item) do
    %{
      id: item.id,
      menu_set_id: item.menu_set_id,
      parent_id: item.parent_id,
      name: item.name,
      title: item.title,
      link_type: item.link_type,
      is_active: item.is_active,
      is_separator: item.is_separator,
      is_root: root_item?(item),
      is_sub_item: sub_item?(item),
      order_index: item.order_index,
      has_icon: has_icon?(item),
      has_badge: has_badge?(item),
      opens_new_window: opens_new_window?(item),
      effective_url: effective_url(item)
    }
  end

  @doc """
  Gera atributos HTML para o link.
  """
  def html_attributes(%__MODULE__{} = item) do
    base_attrs = %{
      "href" => effective_url(item),
      "title" => item.description
    }

    # Adicionar target se necessário
    attrs = if item.target != "_self", do: Map.put(base_attrs, "target", item.target), else: base_attrs

    # Adicionar onclick se necessário
    attrs = if has_onclick?(item), do: Map.put(attrs, "onclick", item.onclick), else: attrs

    # Adicionar classes CSS
    classes = css_classes(item)
    attrs = if length(classes) > 0, do: Map.put(attrs, "class", Enum.join(classes, " ")), else: attrs

    # Adicionar rel para links externos
    attrs = if opens_new_window?(item), do: Map.put(attrs, "rel", "noopener noreferrer"), else: attrs

    attrs
  end

  @doc """
  Verifica se o item é visível para um nível de usuário.
  """
  def visible_for_level?(%__MODULE__{visible_for_levels: levels}, user_level) do
    user_level >= levels
  end

  @doc """
  Retorna sugestões de configuração baseadas no tipo de link.
  """
  def configuration_suggestions(%__MODULE__{link_type: type}) do
    case type do
      "url" ->
        [
          "Use URLs completas para links externos",
          "Configure target adequadamente",
          "Teste se o link funciona",
          "Considere rel='noopener' para _blank"
        ]
      "page" ->
        [
          "Selecione página existente",
          "Verifique se a página está ativa",
          "Configure título descritivo",
          "Teste navegação"
        ]
      "entity" ->
        [
          "Use nome de entidade válido",
          "Verifique se a rota existe",
          "Configure permissões adequadas",
          "Teste funcionalidade"
        ]
      "action" ->
        [
          "Configure ação JavaScript",
          "Teste em diferentes navegadores",
          "Considere fallback",
          "Valide segurança"
        ]
      "separator" ->
        [
          "Use apenas para organização visual",
          "Configure CSS adequado",
          "Evite em menus móveis",
          "Mantenha consistência"
        ]
      _ ->
        [
          "Configure tipo de link adequado",
          "Teste funcionalidade",
          "Valide acessibilidade",
          "Otimize para mobile"
        ]
    end
  end

  @doc """
  Verifica se é um link válido.
  """
  def valid_link?(%__MODULE__{link_type: "url", link_url: url}) do
    is_binary(url) and String.trim(url) != "" and String.trim(url) != "#"
  end
  def valid_link?(%__MODULE__{link_type: "page", page_id: page_id}) do
    is_integer(page_id) and page_id > 0
  end
  def valid_link?(%__MODULE__{link_type: "entity", entity_name: entity}) do
    is_binary(entity) and String.trim(entity) != ""
  end
  def valid_link?(%__MODULE__{link_type: "action", link_url: action}) do
    is_binary(action) and String.trim(action) != ""
  end
  def valid_link?(%__MODULE__{link_type: "separator"}), do: true
  def valid_link?(_), do: false
end
