defmodule DeeperHub.CMS.Forms.FormDisplay do
  @moduledoc """
  Schema para modos de exibição de formulário do sistema usando db_connection.
  Representa diferentes formas de exibir um formulário.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_displays"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para modos de exibição.
  """
  defstruct [
    :id, :form_id, :name, :title, :description, :display_type, :template,
    :css_class, :columns_number, :show_labels, :show_required_mark, :group_fields,
    :is_active, :is_default, :order_index, :created_at
  ]

  @doc """
  Valida dados do modo de exibição.
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

    # Validação do form_id
    form_id = attrs[:form_id] || attrs["form_id"]
    errors = if not is_integer(form_id) or form_id <= 0 do
      ["form_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
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

    # Validação do display_type
    display_type = attrs[:display_type] || attrs["display_type"]
    valid_types = ["form", "view", "edit", "search"]
    errors = if display_type && not Enum.member?(valid_types, display_type) do
      ["display_type deve ser um dos seguintes: #{Enum.join(valid_types, ", ")}" | errors]
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
  Cria um novo modo de exibição com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      form_id: attrs[:form_id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      display_type: attrs[:display_type] || "form",
      template: attrs[:template] || "",
      css_class: attrs[:css_class] || "",
      columns_number: attrs[:columns_number] || 1,
      show_labels: attrs[:show_labels] || true,
      show_required_mark: attrs[:show_required_mark] || true,
      group_fields: attrs[:group_fields] || false,
      is_active: attrs[:is_active] || true,
      is_default: attrs[:is_default] || false,
      order_index: attrs[:order_index] || 0,
      created_at: attrs[:created_at]
    }
  end

  @doc """
  Verifica se o modo está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se é o modo padrão.
  """
  def default?(%__MODULE__{is_default: true}), do: true
  def default?(_), do: false

  @doc """
  Verifica se mostra labels.
  """
  def show_labels?(%__MODULE__{show_labels: true}), do: true
  def show_labels?(_), do: false

  @doc """
  Verifica se mostra marca de obrigatório.
  """
  def show_required_mark?(%__MODULE__{show_required_mark: true}), do: true
  def show_required_mark?(_), do: false

  @doc """
  Verifica se agrupa campos.
  """
  def group_fields?(%__MODULE__{group_fields: true}), do: true
  def group_fields?(_), do: false

  @doc """
  Verifica se é modo de formulário.
  """
  def form_type?(%__MODULE__{display_type: "form"}), do: true
  def form_type?(_), do: false

  @doc """
  Verifica se é modo de visualização.
  """
  def view_type?(%__MODULE__{display_type: "view"}), do: true
  def view_type?(_), do: false

  @doc """
  Verifica se é modo de edição.
  """
  def edit_type?(%__MODULE__{display_type: "edit"}), do: true
  def edit_type?(_), do: false

  @doc """
  Verifica se é modo de busca.
  """
  def search_type?(%__MODULE__{display_type: "search"}), do: true
  def search_type?(_), do: false

  @doc """
  Verifica se é layout de múltiplas colunas.
  """
  def multi_column?(%__MODULE__{columns_number: cols}) when cols > 1, do: true
  def multi_column?(_), do: false

  @doc """
  Retorna informações resumidas do modo.
  """
  def summary(%__MODULE__{} = display) do
    %{
      id: display.id,
      form_id: display.form_id,
      name: display.name,
      title: display.title,
      display_type: display.display_type,
      is_active: display.is_active,
      is_default: display.is_default,
      columns_number: display.columns_number,
      show_labels: display.show_labels,
      show_required_mark: display.show_required_mark,
      group_fields: display.group_fields,
      is_multi_column: multi_column?(display)
    }
  end
end
