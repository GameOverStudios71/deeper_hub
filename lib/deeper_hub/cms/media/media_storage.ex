defmodule DeeperHub.CMS.Media.MediaStorage do
  @moduledoc """
  Schema para configurações de armazenamento de mídia do sistema usando db_connection.
  Representa diferentes tipos de storage (local, S3, FTP, etc.).
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_media_storage"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para configurações de storage.
  """
  defstruct [
    :id, :name, :title, :description, :storage_type, :config, :base_url, :base_path,
    :max_file_size, :allowed_extensions, :quota_limit, :quota_used, :is_active,
    :is_default, :is_public, :created_at, :updated_at
  ]

  @doc """
  Valida dados do storage.
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

    # Validação do storage_type
    storage_type = attrs[:storage_type] || attrs["storage_type"]
    valid_types = ["local", "s3", "ftp", "sftp", "dropbox", "google_drive", "azure"]
    errors = if not is_binary(storage_type) or not Enum.member?(valid_types, storage_type) do
      ["storage_type deve ser um dos seguintes: #{Enum.join(valid_types, ", ")}" | errors]
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
  Cria um novo storage com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      storage_type: attrs[:storage_type] || "local",
      config: attrs[:config] || "{}",
      base_url: attrs[:base_url] || "",
      base_path: attrs[:base_path] || "",
      max_file_size: attrs[:max_file_size] || 10485760,
      allowed_extensions: attrs[:allowed_extensions] || "[]",
      quota_limit: attrs[:quota_limit] || 0,
      quota_used: attrs[:quota_used] || 0,
      is_active: attrs[:is_active] || true,
      is_default: attrs[:is_default] || false,
      is_public: attrs[:is_public] || true,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  @doc """
  Verifica se o storage está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se é o storage padrão.
  """
  def default?(%__MODULE__{is_default: true}), do: true
  def default?(_), do: false

  @doc """
  Verifica se é público.
  """
  def public?(%__MODULE__{is_public: true}), do: true
  def public?(_), do: false

  @doc """
  Verifica se é storage local.
  """
  def local?(%__MODULE__{storage_type: "local"}), do: true
  def local?(_), do: false

  @doc """
  Verifica se é storage S3.
  """
  def s3?(%__MODULE__{storage_type: "s3"}), do: true
  def s3?(_), do: false

  @doc """
  Verifica se é storage FTP.
  """
  def ftp?(%__MODULE__{storage_type: "ftp"}), do: true
  def ftp?(_), do: false

  @doc """
  Verifica se é storage na nuvem.
  """
  def cloud?(%__MODULE__{storage_type: type}) do
    type in ["s3", "dropbox", "google_drive", "azure"]
  end

  @doc """
  Retorna a configuração como mapa.
  """
  def configuration(%__MODULE__{config: config}) when is_binary(config) and config != "" do
    case Jason.decode(config) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def configuration(_), do: %{}

  @doc """
  Retorna as extensões permitidas como lista.
  """
  def allowed_extensions_list(%__MODULE__{allowed_extensions: extensions}) when is_binary(extensions) and extensions != "" do
    case Jason.decode(extensions) do
      {:ok, list} when is_list(list) -> list
      {:error, _} -> []
    end
  end
  def allowed_extensions_list(_), do: []

  @doc """
  Verifica se uma extensão é permitida.
  """
  def extension_allowed?(%__MODULE__{} = storage, extension) do
    allowed = allowed_extensions_list(storage)
    length(allowed) == 0 or String.downcase(extension) in Enum.map(allowed, &String.downcase/1)
  end

  @doc """
  Verifica se tem limite de quota.
  """
  def has_quota_limit?(%__MODULE__{quota_limit: limit}) do
    is_integer(limit) and limit > 0
  end

  @doc """
  Verifica se a quota foi excedida.
  """
  def quota_exceeded?(%__MODULE__{quota_limit: limit, quota_used: used}) when is_integer(limit) and limit > 0 do
    used >= limit
  end
  def quota_exceeded?(_), do: false

  @doc """
  Retorna informações de quota.
  """
  def quota_info(%__MODULE__{quota_limit: limit, quota_used: used}) do
    %{
      has_limit: has_quota_limit?(%__MODULE__{quota_limit: limit}),
      limit: limit,
      used: used,
      available: if(limit > 0, do: max(0, limit - used), else: :unlimited),
      percentage: if(limit > 0, do: min(100, round(used / limit * 100)), else: 0),
      exceeded: quota_exceeded?(%__MODULE__{quota_limit: limit, quota_used: used})
    }
  end

  @doc """
  Retorna informações de tamanho de arquivo.
  """
  def file_size_info(%__MODULE__{max_file_size: max_size}) do
    %{
      max_bytes: max_size,
      max_mb: round(max_size / 1024 / 1024),
      max_kb: round(max_size / 1024),
      formatted: format_file_size(max_size)
    }
  end

  @doc """
  Verifica se um arquivo pode ser enviado (tamanho).
  """
  def file_size_allowed?(%__MODULE__{max_file_size: max_size}, file_size) do
    max_size == 0 or file_size <= max_size
  end

  @doc """
  Retorna características do tipo de storage.
  """
  def storage_characteristics(%__MODULE__{storage_type: type}) do
    case type do
      "local" ->
        %{
          requires_credentials: false,
          supports_direct_access: true,
          supports_cdn: false,
          backup_recommended: true,
          scalability: :limited,
          cost: :low
        }
      "s3" ->
        %{
          requires_credentials: true,
          supports_direct_access: true,
          supports_cdn: true,
          backup_recommended: false,
          scalability: :unlimited,
          cost: :medium
        }
      "ftp" ->
        %{
          requires_credentials: true,
          supports_direct_access: false,
          supports_cdn: false,
          backup_recommended: true,
          scalability: :medium,
          cost: :low
        }
      "sftp" ->
        %{
          requires_credentials: true,
          supports_direct_access: false,
          supports_cdn: false,
          backup_recommended: true,
          scalability: :medium,
          cost: :low
        }
      "dropbox" ->
        %{
          requires_credentials: true,
          supports_direct_access: true,
          supports_cdn: false,
          backup_recommended: false,
          scalability: :high,
          cost: :medium
        }
      "google_drive" ->
        %{
          requires_credentials: true,
          supports_direct_access: true,
          supports_cdn: false,
          backup_recommended: false,
          scalability: :high,
          cost: :medium
        }
      "azure" ->
        %{
          requires_credentials: true,
          supports_direct_access: true,
          supports_cdn: true,
          backup_recommended: false,
          scalability: :unlimited,
          cost: :medium
        }
      _ ->
        %{
          requires_credentials: false,
          supports_direct_access: false,
          supports_cdn: false,
          backup_recommended: true,
          scalability: :unknown,
          cost: :unknown
        }
    end
  end

  @doc """
  Retorna informações resumidas do storage.
  """
  def summary(%__MODULE__{} = storage) do
    %{
      id: storage.id,
      name: storage.name,
      title: storage.title,
      storage_type: storage.storage_type,
      is_active: storage.is_active,
      is_default: storage.is_default,
      is_public: storage.is_public,
      is_local: local?(storage),
      is_cloud: cloud?(storage),
      max_file_size_mb: round(storage.max_file_size / 1024 / 1024),
      allowed_extensions_count: length(allowed_extensions_list(storage)),
      has_quota_limit: has_quota_limit?(storage),
      quota_exceeded: quota_exceeded?(storage)
    }
  end

  @doc """
  Retorna sugestões de configuração baseadas no tipo.
  """
  def configuration_suggestions(%__MODULE__{storage_type: type}) do
    case type do
      "local" ->
        [
          "Configure permissões adequadas na pasta",
          "Implemente backup regular",
          "Monitore espaço em disco",
          "Configure nginx/apache para servir arquivos"
        ]
      "s3" ->
        [
          "Configure credenciais AWS",
          "Defina políticas de bucket adequadas",
          "Configure CloudFront para CDN",
          "Implemente lifecycle policies"
        ]
      "ftp" ->
        [
          "Use conexão segura (FTPS)",
          "Configure timeouts adequados",
          "Teste conectividade regularmente",
          "Implemente retry logic"
        ]
      "sftp" ->
        [
          "Configure chaves SSH",
          "Use autenticação por chave",
          "Configure timeouts adequados",
          "Teste conectividade regularmente"
        ]
      "dropbox" ->
        [
          "Configure API tokens",
          "Respeite rate limits",
          "Implemente refresh tokens",
          "Configure webhooks se necessário"
        ]
      "google_drive" ->
        [
          "Configure OAuth2",
          "Respeite quotas da API",
          "Implemente refresh tokens",
          "Configure permissões adequadas"
        ]
      "azure" ->
        [
          "Configure connection strings",
          "Defina políticas de acesso",
          "Configure CDN se necessário",
          "Implemente lifecycle management"
        ]
      _ ->
        [
          "Configure conforme documentação",
          "Teste conectividade",
          "Implemente tratamento de erros",
          "Monitore performance"
        ]
    end
  end

  @doc """
  Formata tamanho de arquivo em formato legível.
  """
  def format_file_size(bytes) when is_integer(bytes) do
    cond do
      bytes >= 1_073_741_824 -> "#{Float.round(bytes / 1_073_741_824, 2)} GB"
      bytes >= 1_048_576 -> "#{Float.round(bytes / 1_048_576, 2)} MB"
      bytes >= 1024 -> "#{Float.round(bytes / 1024, 2)} KB"
      true -> "#{bytes} bytes"
    end
  end
  def format_file_size(_), do: "0 bytes"

  @doc """
  Retorna URL completa para um arquivo.
  """
  def file_url(%__MODULE__{base_url: base_url}, file_path) when is_binary(base_url) and base_url != "" do
    Path.join(base_url, file_path)
  end
  def file_url(_, file_path), do: file_path

  @doc """
  Retorna caminho completo para um arquivo.
  """
  def file_full_path(%__MODULE__{base_path: base_path}, file_path) when is_binary(base_path) and base_path != "" do
    Path.join(base_path, file_path)
  end
  def file_full_path(_, file_path), do: file_path

  @doc """
  Verifica se requer credenciais.
  """
  def requires_credentials?(%__MODULE__{} = storage) do
    characteristics = storage_characteristics(storage)
    characteristics.requires_credentials
  end

  @doc """
  Verifica se suporta acesso direto.
  """
  def supports_direct_access?(%__MODULE__{} = storage) do
    characteristics = storage_characteristics(storage)
    characteristics.supports_direct_access
  end

  @doc """
  Verifica se suporta CDN.
  """
  def supports_cdn?(%__MODULE__{} = storage) do
    characteristics = storage_characteristics(storage)
    characteristics.supports_cdn
  end
end
