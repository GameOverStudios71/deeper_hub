defmodule DeeperHub.CMS.Forms do
  @moduledoc """
  Contexto para gerenciar formulários do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Forms.{Form, FormFieldType}

  # ============================================================================
  # FORMS
  # ============================================================================

  @doc """
  Lista todos os formulários.
  """
  def list_forms do
    sql = """
    SELECT f.id, f.name, f.title, f.description, f.module, f.submit_name, f.table_name,
           f.action_url, f.method, f.enctype, f.form_attrs, f.css_class, f.template,
           f.redirect_url, f.success_message, f.error_message, f.email_template,
           f.email_to, f.email_subject, f.ajax_mode, f.captcha_enabled, f.honeypot_enabled,
           f.rate_limit, f.is_active, f.is_system, f.created_at, f.updated_at, f.created_by
    FROM cms_forms f
    ORDER BY f.is_system ASC, f.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        forms = Enum.map(rows, &row_to_form/1)
        {:ok, forms}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista formulários ativos.
  """
  def list_active_forms do
    sql = """
    SELECT f.id, f.name, f.title, f.description, f.module, f.submit_name, f.table_name,
           f.action_url, f.method, f.enctype, f.form_attrs, f.css_class, f.template,
           f.redirect_url, f.success_message, f.error_message, f.email_template,
           f.email_to, f.email_subject, f.ajax_mode, f.captcha_enabled, f.honeypot_enabled,
           f.rate_limit, f.is_active, f.is_system, f.created_at, f.updated_at, f.created_by
    FROM cms_forms f
    WHERE f.is_active = true
    ORDER BY f.title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        forms = Enum.map(rows, &row_to_form/1)
        {:ok, forms}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca formulário por ID.
  """
  def get_form(id) do
    sql = """
    SELECT f.id, f.name, f.title, f.description, f.module, f.submit_name, f.table_name,
           f.action_url, f.method, f.enctype, f.form_attrs, f.css_class, f.template,
           f.redirect_url, f.success_message, f.error_message, f.email_template,
           f.email_to, f.email_subject, f.ajax_mode, f.captcha_enabled, f.honeypot_enabled,
           f.rate_limit, f.is_active, f.is_system, f.created_at, f.updated_at, f.created_by
    FROM cms_forms f
    WHERE f.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        form = row_to_form(row)
        {:ok, form}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca formulário por nome.
  """
  def get_form_by_name(name) do
    sql = """
    SELECT f.id, f.name, f.title, f.description, f.module, f.submit_name, f.table_name,
           f.action_url, f.method, f.enctype, f.form_attrs, f.css_class, f.template,
           f.redirect_url, f.success_message, f.error_message, f.email_template,
           f.email_to, f.email_subject, f.ajax_mode, f.captcha_enabled, f.honeypot_enabled,
           f.rate_limit, f.is_active, f.is_system, f.created_at, f.updated_at, f.created_by
    FROM cms_forms f
    WHERE f.name = $1
    """

    case Connection.query(sql, [name]) do
      {:ok, %{rows: [row]}} ->
        form = row_to_form(row)
        {:ok, form}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo formulário.
  """
  def create_form(attrs) do
    case Form.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO cms_forms (
          name, title, description, module, submit_name, table_name, action_url, method,
          enctype, form_attrs, css_class, template, redirect_url, success_message,
          error_message, email_template, email_to, email_subject, ajax_mode, captcha_enabled,
          honeypot_enabled, rate_limit, is_active, is_system, created_at, updated_at, created_by
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18,
          $19, $20, $21, $22, $23, $24, $25, $26, $27
        ) RETURNING id
        """

        params = [
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:module] || "cms",
          validated_attrs[:submit_name] || "Enviar",
          validated_attrs[:table_name] || "",
          validated_attrs[:action_url] || "",
          validated_attrs[:method] || "POST",
          validated_attrs[:enctype] || "multipart/form-data",
          validated_attrs[:form_attrs] || "",
          validated_attrs[:css_class] || "",
          validated_attrs[:template] || "form.html",
          validated_attrs[:redirect_url] || "",
          validated_attrs[:success_message] || "Formulário enviado com sucesso!",
          validated_attrs[:error_message] || "Erro ao enviar formulário.",
          validated_attrs[:email_template] || "",
          validated_attrs[:email_to] || "",
          validated_attrs[:email_subject] || "",
          validated_attrs[:ajax_mode] || true,
          validated_attrs[:captcha_enabled] || false,
          validated_attrs[:honeypot_enabled] || true,
          validated_attrs[:rate_limit] || 0,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_system] || false,
          now,
          now,
          validated_attrs[:created_by]
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_form(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza um formulário.
  """
  def update_form(id, attrs) do
    case Form.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        UPDATE cms_forms SET
          name = $2, title = $3, description = $4, module = $5, submit_name = $6,
          table_name = $7, action_url = $8, method = $9, enctype = $10, form_attrs = $11,
          css_class = $12, template = $13, redirect_url = $14, success_message = $15,
          error_message = $16, email_template = $17, email_to = $18, email_subject = $19,
          ajax_mode = $20, captcha_enabled = $21, honeypot_enabled = $22, rate_limit = $23,
          is_active = $24, is_system = $25, updated_at = $26, created_by = $27
        WHERE id = $1
        """

        params = [
          id,
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:module] || "cms",
          validated_attrs[:submit_name] || "Enviar",
          validated_attrs[:table_name] || "",
          validated_attrs[:action_url] || "",
          validated_attrs[:method] || "POST",
          validated_attrs[:enctype] || "multipart/form-data",
          validated_attrs[:form_attrs] || "",
          validated_attrs[:css_class] || "",
          validated_attrs[:template] || "form.html",
          validated_attrs[:redirect_url] || "",
          validated_attrs[:success_message] || "Formulário enviado com sucesso!",
          validated_attrs[:error_message] || "Erro ao enviar formulário.",
          validated_attrs[:email_template] || "",
          validated_attrs[:email_to] || "",
          validated_attrs[:email_subject] || "",
          validated_attrs[:ajax_mode] || true,
          validated_attrs[:captcha_enabled] || false,
          validated_attrs[:honeypot_enabled] || true,
          validated_attrs[:rate_limit] || 0,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_system] || false,
          now,
          validated_attrs[:created_by]
        ]

        case Connection.query(sql, params) do
          {:ok, _} ->
            get_form(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Deleta um formulário.
  """
  def delete_form(id) do
    sql = "DELETE FROM cms_forms WHERE id = $1 AND is_system = false"

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
  # FORM FIELD TYPES
  # ============================================================================

  @doc """
  Lista todos os tipos de campo.
  """
  def list_form_field_types do
    sql = """
    SELECT id, name, title, description, input_type, validation_rules, default_options,
           is_active, is_system, created_at, order_index
    FROM cms_form_field_types
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        types = Enum.map(rows, &row_to_form_field_type/1)
        {:ok, types}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_form([id, name, title, description, module, submit_name, table_name,
                    action_url, method, enctype, form_attrs, css_class, template,
                    redirect_url, success_message, error_message, email_template,
                    email_to, email_subject, ajax_mode, captcha_enabled, honeypot_enabled,
                    rate_limit, is_active, is_system, created_at, updated_at, created_by]) do
    Form.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      module: module,
      submit_name: submit_name,
      table_name: table_name,
      action_url: action_url,
      method: method,
      enctype: enctype,
      form_attrs: form_attrs,
      css_class: css_class,
      template: template,
      redirect_url: redirect_url,
      success_message: success_message,
      error_message: error_message,
      email_template: email_template,
      email_to: email_to,
      email_subject: email_subject,
      ajax_mode: ajax_mode,
      captcha_enabled: captcha_enabled,
      honeypot_enabled: honeypot_enabled,
      rate_limit: rate_limit,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      updated_at: updated_at,
      created_by: created_by
    })
  end

  defp row_to_form_field_type([id, name, title, description, input_type, validation_rules, default_options,
                               is_active, is_system, created_at, order_index]) do
    FormFieldType.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      input_type: input_type,
      validation_rules: validation_rules,
      default_options: default_options,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      order_index: order_index
    })
  end
end
