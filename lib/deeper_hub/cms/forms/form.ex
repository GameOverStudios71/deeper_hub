defmodule DeeperHub.CMS.Forms.Form do
  @moduledoc """
  Schema para formulários do sistema usando db_connection.
  Representa formulários que podem ser inseridos em páginas.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_forms"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para formulários.
  """
  defstruct [
    :id, :name, :title, :description, :module, :submit_name, :table_name,
    :action_url, :method, :enctype, :form_attrs, :css_class, :template,
    :redirect_url, :success_message, :error_message, :email_template,
    :email_to, :email_subject, :ajax_mode, :captcha_enabled, :honeypot_enabled,
    :rate_limit, :is_active, :is_system, :created_at, :updated_at, :created_by
  ]

  @doc """
  Valida dados do formulário.
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

    # Validação do method
    method = attrs[:method] || attrs["method"]
    valid_methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    errors = if method && not Enum.member?(valid_methods, String.upcase(method)) do
      ["method deve ser um dos seguintes: #{Enum.join(valid_methods, ", ")}" | errors]
    else
      errors
    end

    # Validação do enctype
    enctype = attrs[:enctype] || attrs["enctype"]
    valid_enctypes = ["application/x-www-form-urlencoded", "multipart/form-data", "text/plain"]
    errors = if enctype && not Enum.member?(valid_enctypes, enctype) do
      ["enctype deve ser um dos seguintes: #{Enum.join(valid_enctypes, ", ")}" | errors]
    else
      errors
    end

    # Validação do rate_limit
    rate_limit = attrs[:rate_limit] || attrs["rate_limit"]
    errors = if rate_limit && (not is_integer(rate_limit) or rate_limit < 0) do
      ["rate_limit deve ser um número inteiro não negativo" | errors]
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
  Cria um novo formulário com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      module: attrs[:module] || "cms",
      submit_name: attrs[:submit_name] || "Enviar",
      table_name: attrs[:table_name] || "",
      action_url: attrs[:action_url] || "",
      method: attrs[:method] || "POST",
      enctype: attrs[:enctype] || "multipart/form-data",
      form_attrs: attrs[:form_attrs] || "",
      css_class: attrs[:css_class] || "",
      template: attrs[:template] || "form.html",
      redirect_url: attrs[:redirect_url] || "",
      success_message: attrs[:success_message] || "Formulário enviado com sucesso!",
      error_message: attrs[:error_message] || "Erro ao enviar formulário.",
      email_template: attrs[:email_template] || "",
      email_to: attrs[:email_to] || "",
      email_subject: attrs[:email_subject] || "",
      ajax_mode: attrs[:ajax_mode] || true,
      captcha_enabled: attrs[:captcha_enabled] || false,
      honeypot_enabled: attrs[:honeypot_enabled] || true,
      rate_limit: attrs[:rate_limit] || 0,
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      created_by: attrs[:created_by]
    }
  end

  @doc """
  Verifica se o formulário está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o formulário é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Verifica se o formulário usa AJAX.
  """
  def ajax_mode?(%__MODULE__{ajax_mode: true}), do: true
  def ajax_mode?(_), do: false

  @doc """
  Verifica se o CAPTCHA está habilitado.
  """
  def captcha_enabled?(%__MODULE__{captcha_enabled: true}), do: true
  def captcha_enabled?(_), do: false

  @doc """
  Verifica se o honeypot está habilitado.
  """
  def honeypot_enabled?(%__MODULE__{honeypot_enabled: true}), do: true
  def honeypot_enabled?(_), do: false

  @doc """
  Verifica se tem limite de taxa.
  """
  def rate_limited?(%__MODULE__{rate_limit: limit}) do
    is_integer(limit) and limit > 0
  end

  @doc """
  Verifica se tem tabela personalizada para salvar dados.
  """
  def has_custom_table?(%__MODULE__{table_name: table}) do
    is_binary(table) and String.trim(table) != ""
  end

  @doc """
  Verifica se tem URL de ação personalizada.
  """
  def has_custom_action?(%__MODULE__{action_url: url}) do
    is_binary(url) and String.trim(url) != ""
  end

  @doc """
  Verifica se tem redirecionamento após envio.
  """
  def has_redirect?(%__MODULE__{redirect_url: url}) do
    is_binary(url) and String.trim(url) != ""
  end

  @doc """
  Verifica se tem configuração de email.
  """
  def has_email_config?(%__MODULE__{email_to: email}) do
    is_binary(email) and String.trim(email) != ""
  end

  @doc """
  Verifica se tem template personalizado.
  """
  def has_custom_template?(%__MODULE__{template: template}) do
    is_binary(template) and template != "form.html" and String.trim(template) != ""
  end

  @doc """
  Verifica se tem classes CSS.
  """
  def has_css_class?(%__MODULE__{css_class: css_class}) do
    is_binary(css_class) and String.trim(css_class) != ""
  end

  @doc """
  Verifica se tem atributos HTML personalizados.
  """
  def has_form_attrs?(%__MODULE__{form_attrs: attrs}) do
    is_binary(attrs) and String.trim(attrs) != ""
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
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template: template}, base_path \\ "templates/forms/") do
    cond do
      template == "" ->
        Path.join(base_path, "form.html")
      String.starts_with?(template, "/") ->
        template
      true ->
        Path.join(base_path, template)
    end
  end

  @doc """
  Verifica se é um formulário GET.
  """
  def get_method?(%__MODULE__{method: "GET"}), do: true
  def get_method?(_), do: false

  @doc """
  Verifica se é um formulário POST.
  """
  def post_method?(%__MODULE__{method: "POST"}), do: true
  def post_method?(_), do: false

  @doc """
  Verifica se aceita upload de arquivos.
  """
  def accepts_files?(%__MODULE__{enctype: "multipart/form-data"}), do: true
  def accepts_files?(_), do: false

  @doc """
  Retorna informações de segurança do formulário.
  """
  def security_info(%__MODULE__{} = form) do
    %{
      captcha_enabled: captcha_enabled?(form),
      honeypot_enabled: honeypot_enabled?(form),
      rate_limited: rate_limited?(form),
      rate_limit: form.rate_limit,
      accepts_files: accepts_files?(form)
    }
  end

  @doc """
  Retorna informações de email do formulário.
  """
  def email_info(%__MODULE__{} = form) do
    %{
      enabled: has_email_config?(form),
      email_to: form.email_to,
      email_subject: form.email_subject,
      email_template: form.email_template,
      has_custom_template: form.email_template != ""
    }
  end

  @doc """
  Retorna informações de comportamento do formulário.
  """
  def behavior_info(%__MODULE__{} = form) do
    %{
      ajax_mode: ajax_mode?(form),
      has_redirect: has_redirect?(form),
      redirect_url: form.redirect_url,
      has_custom_action: has_custom_action?(form),
      action_url: form.action_url,
      method: form.method,
      enctype: form.enctype
    }
  end

  @doc """
  Retorna informações resumidas do formulário.
  """
  def summary(%__MODULE__{} = form) do
    %{
      id: form.id,
      name: form.name,
      title: form.title,
      module: form.module,
      is_active: form.is_active,
      is_system: form.is_system,
      ajax_mode: form.ajax_mode,
      captcha_enabled: form.captcha_enabled,
      honeypot_enabled: form.honeypot_enabled,
      rate_limited: rate_limited?(form),
      has_email_config: has_email_config?(form),
      has_custom_table: has_custom_table?(form),
      has_redirect: has_redirect?(form),
      accepts_files: accepts_files?(form)
    }
  end

  @doc """
  Retorna características do formulário baseadas no método.
  """
  def method_characteristics(%__MODULE__{method: method}) do
    case String.upcase(method) do
      "GET" ->
        %{
          cacheable: true,
          idempotent: true,
          safe: true,
          supports_files: false,
          url_length_limit: true
        }
      "POST" ->
        %{
          cacheable: false,
          idempotent: false,
          safe: false,
          supports_files: true,
          url_length_limit: false
        }
      "PUT" ->
        %{
          cacheable: false,
          idempotent: true,
          safe: false,
          supports_files: true,
          url_length_limit: false
        }
      "PATCH" ->
        %{
          cacheable: false,
          idempotent: false,
          safe: false,
          supports_files: true,
          url_length_limit: false
        }
      "DELETE" ->
        %{
          cacheable: false,
          idempotent: true,
          safe: false,
          supports_files: false,
          url_length_limit: false
        }
      _ ->
        %{
          cacheable: false,
          idempotent: false,
          safe: false,
          supports_files: false,
          url_length_limit: true
        }
    end
  end

  @doc """
  Verifica se o método é seguro (não modifica dados).
  """
  def safe_method?(%__MODULE__{} = form) do
    characteristics = method_characteristics(form)
    characteristics.safe
  end

  @doc """
  Verifica se o método é idempotente.
  """
  def idempotent_method?(%__MODULE__{} = form) do
    characteristics = method_characteristics(form)
    characteristics.idempotent
  end

  @doc """
  Verifica se o método é cacheável.
  """
  def cacheable_method?(%__MODULE__{} = form) do
    characteristics = method_characteristics(form)
    characteristics.cacheable
  end
end
