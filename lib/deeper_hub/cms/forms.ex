defmodule DeeperHub.CMS.Forms do
  @moduledoc """
  Contexto para gerenciar formulários do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Forms.{Form, FormFieldType, FormField, FormDisplay}

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

  # ============================================================================
  # FORM FIELD TYPES - CRUD METHODS
  # ============================================================================

  @doc """
  Cria um novo tipo de campo.
  """
  def create_form_field_type(attrs) do
    sql = """
    INSERT INTO cms_form_field_types (name, title, description, input_type, validation_rules,
                                      default_options, is_active, is_system, order_index)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:name],
      attrs[:title],
      attrs[:description] || "",
      attrs[:input_type],
      attrs[:validation_rules] || "",
      attrs[:default_options] || "",
      if(attrs[:is_active] == false, do: 0, else: 1),
      if(attrs[:is_system] == true, do: 1, else: 0),
      attrs[:order_index] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        # Para SQLite, INSERT bem-sucedido retorna num_rows: 0
        case Connection.query("SELECT id FROM cms_form_field_types WHERE name = ? ORDER BY id DESC LIMIT 1", [attrs[:name]]) do
          {:ok, %{rows: [[id]]}} ->
            get_form_field_type(id)
          {:ok, %{rows: []}} ->
            {:error, :not_found}
          {:error, error} ->
            {:error, error}
        end
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém um tipo de campo específico pelo ID.
  """
  def get_form_field_type(id) do
    sql = """
    SELECT id, name, title, description, input_type, validation_rules, default_options,
           is_active, is_system, created_at, order_index
    FROM cms_form_field_types
    WHERE id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        type = row_to_form_field_type(row)
        {:ok, type}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # FORM FIELDS
  # ============================================================================

  @doc """
  Lista todos os campos de formulário.
  """
  def list_form_fields do
    sql = """
    SELECT ff.id, ff.form_id, ff.field_type_id, ff.name, ff.title, ff.description,
           ff.placeholder, ff.default_value, ff.validation_message, ff.is_required,
           ff.is_unique, ff.is_searchable, ff.is_sortable, ff.is_filterable,
           ff.options_source, ff.options_list_id, ff.options_data, ff.css_class,
           ff.wrapper_class, ff.label_class, ff.input_attrs, ff.conditional_logic,
           ff.is_active, ff.order_index, ff.created_at, ff.updated_at,
           ft.title as field_type_title, f.title as form_title
    FROM cms_form_fields ff
    LEFT JOIN cms_form_field_types ft ON ff.field_type_id = ft.id
    LEFT JOIN cms_forms f ON ff.form_id = f.id
    ORDER BY ff.form_id ASC, ff.order_index ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        fields = Enum.map(rows, &row_to_form_field/1)
        {:ok, fields}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo campo de formulário.
  """
  def create_form_field(attrs) do
    sql = """
    INSERT INTO cms_form_fields (form_id, field_type_id, name, title, description, input_type,
                                 placeholder, default_value, validation_message, is_required, is_unique,
                                 is_searchable, is_sortable, is_filterable, options_source,
                                 options_list_id, options_data, css_class, wrapper_class,
                                 label_class, input_attrs, conditional_logic, is_active, order_index)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:form_id],
      attrs[:field_type_id],
      attrs[:name],
      attrs[:title],
      attrs[:description] || "",
      attrs[:input_type] || "text",
      attrs[:placeholder] || "",
      attrs[:default_value] || "",
      attrs[:validation_message] || "",
      if(attrs[:is_required] == true, do: 1, else: 0),
      if(attrs[:is_unique] == true, do: 1, else: 0),
      if(attrs[:is_searchable] == true, do: 1, else: 0),
      if(attrs[:is_sortable] == true, do: 1, else: 0),
      if(attrs[:is_filterable] == true, do: 1, else: 0),
      attrs[:options_source] || "manual",
      attrs[:options_list_id],
      attrs[:options_data] || "",
      attrs[:css_class] || "",
      attrs[:wrapper_class] || "",
      attrs[:label_class] || "",
      attrs[:input_attrs] || "",
      attrs[:conditional_logic] || "",
      if(attrs[:is_active] == false, do: 0, else: 1),
      attrs[:order_index] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_form_fields WHERE name = ? AND form_id = ? ORDER BY id DESC LIMIT 1", [attrs[:name], attrs[:form_id]]) do
          {:ok, %{rows: [[id]]}} ->
            get_form_field(id)
          {:ok, %{rows: []}} ->
            {:error, :not_found}
          {:error, error} ->
            {:error, error}
        end
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém um campo específico pelo ID.
  """
  def get_form_field(id) do
    sql = """
    SELECT ff.id, ff.form_id, ff.field_type_id, ff.name, ff.title, ff.description,
           ff.placeholder, ff.default_value, ff.validation_message, ff.is_required,
           ff.is_unique, ff.is_searchable, ff.is_sortable, ff.is_filterable,
           ff.options_source, ff.options_list_id, ff.options_data, ff.css_class,
           ff.wrapper_class, ff.label_class, ff.input_attrs, ff.conditional_logic,
           ff.is_active, ff.order_index, ff.created_at, ff.updated_at,
           ft.title as field_type_title, f.title as form_title
    FROM cms_form_fields ff
    LEFT JOIN cms_form_field_types ft ON ff.field_type_id = ft.id
    LEFT JOIN cms_forms f ON ff.form_id = f.id
    WHERE ff.id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        field = row_to_form_field(row)
        {:ok, field}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # FORM DISPLAYS
  # ============================================================================

  @doc """
  Lista todos os modos de exibição.
  """
  def list_form_displays do
    sql = """
    SELECT fd.id, fd.form_id, fd.name, fd.title, fd.description, fd.display_type,
           fd.template, fd.css_class, fd.columns_number, fd.show_labels,
           fd.show_required_mark, fd.group_fields, fd.is_active, fd.is_default,
           fd.order_index, fd.created_at, f.title as form_title
    FROM cms_form_displays fd
    LEFT JOIN cms_forms f ON fd.form_id = f.id
    ORDER BY fd.form_id ASC, fd.order_index ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        displays = Enum.map(rows, &row_to_form_display/1)
        {:ok, displays}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo modo de exibição.
  """
  def create_form_display(attrs) do
    sql = """
    INSERT INTO cms_form_displays (form_id, name, title, description, display_type, template,
                                   css_class, columns_number, show_labels, show_required_mark,
                                   group_fields, is_active, is_default, order_index)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """

    params = [
      attrs[:form_id],
      attrs[:name],
      attrs[:title],
      attrs[:description] || "",
      attrs[:display_type] || "form",
      attrs[:template] || "",
      attrs[:css_class] || "",
      attrs[:columns_number] || 1,
      if(attrs[:show_labels] == false, do: 0, else: 1),
      if(attrs[:show_required_mark] == false, do: 0, else: 1),
      if(attrs[:group_fields] == true, do: 1, else: 0),
      if(attrs[:is_active] == false, do: 0, else: 1),
      if(attrs[:is_default] == true, do: 1, else: 0),
      attrs[:order_index] || 0
    ]

    case Connection.query(sql, params) do
      {:ok, %{num_rows: 0}} ->
        case Connection.query("SELECT id FROM cms_form_displays WHERE name = ? AND form_id = ? ORDER BY id DESC LIMIT 1", [attrs[:name], attrs[:form_id]]) do
          {:ok, %{rows: [[id]]}} ->
            get_form_display(id)
          {:ok, %{rows: []}} ->
            {:error, :not_found}
          {:error, error} ->
            {:error, error}
        end
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém um modo de exibição específico pelo ID.
  """
  def get_form_display(id) do
    sql = """
    SELECT fd.id, fd.form_id, fd.name, fd.title, fd.description, fd.display_type,
           fd.template, fd.css_class, fd.columns_number, fd.show_labels,
           fd.show_required_mark, fd.group_fields, fd.is_active, fd.is_default,
           fd.order_index, fd.created_at, f.title as form_title
    FROM cms_form_displays fd
    LEFT JOIN cms_forms f ON fd.form_id = f.id
    WHERE fd.id = ?
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        display = row_to_form_display(row)
        {:ok, display}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # Helper functions for row conversion
  defp row_to_form_field(row) do
    [id, form_id, field_type_id, name, title, description, placeholder, default_value,
     validation_message, is_required, is_unique, is_searchable, is_sortable, is_filterable,
     options_source, options_list_id, options_data, css_class, wrapper_class, label_class,
     input_attrs, conditional_logic, is_active, order_index, created_at, updated_at,
     _field_type_title, _form_title] = row

    FormField.new(%{
      id: id,
      form_id: form_id,
      field_type_id: field_type_id,
      name: name,
      title: title,
      description: description,
      placeholder: placeholder,
      default_value: default_value,
      validation_message: validation_message,
      is_required: is_required == 1,
      is_unique: is_unique == 1,
      is_searchable: is_searchable == 1,
      is_sortable: is_sortable == 1,
      is_filterable: is_filterable == 1,
      options_source: options_source,
      options_list_id: options_list_id,
      options_data: options_data,
      css_class: css_class,
      wrapper_class: wrapper_class,
      label_class: label_class,
      input_attrs: input_attrs,
      conditional_logic: conditional_logic,
      is_active: is_active == 1,
      order_index: order_index,
      created_at: created_at,
      updated_at: updated_at
    })
  end

  defp row_to_form_display(row) do
    [id, form_id, name, title, description, display_type, template, css_class,
     columns_number, show_labels, show_required_mark, group_fields, is_active,
     is_default, order_index, created_at, _form_title] = row

    FormDisplay.new(%{
      id: id,
      form_id: form_id,
      name: name,
      title: title,
      description: description,
      display_type: display_type,
      template: template,
      css_class: css_class,
      columns_number: columns_number,
      show_labels: show_labels == 1,
      show_required_mark: show_required_mark == 1,
      group_fields: group_fields == 1,
      is_active: is_active == 1,
      is_default: is_default == 1,
      order_index: order_index,
      created_at: created_at
    })
  end
end
