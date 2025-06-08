# <file path="deeper_hub/core/logger/logger.ex">
defmodule DeeperHub.Core.Logger do
  @moduledoc """
  Módulo responsável pelo sistema de logging centralizado do DeeperHub.
  Ele fornece funcionalidades para registrar mensagens de log em diferentes níveis,
  com formatação customizável e integração com diferentes coletores de log (sinks).

  Este módulo implementa macros para cada nível de log (:debug, :info, :warning, :error, :critical)
  que capturam automaticamente o módulo chamador e aplicam formatação consistente.

  ## Funcionalidades de Arquivo de Log

  - Logs de nível :error e :critical são automaticamente gravados em arquivos no diretório "logs/"
  - Arquivos são nomeados no formato "error_YYYY-MM-DD.log"
  - O diretório de logs é criado automaticamente se não existir
  - Função de limpeza automática de logs antigos disponível

  ## Exemplos

      # Logs básicos (aparecem no console)
      Logger.info("Sistema iniciado")
      Logger.warning("Configuração não encontrada")

      # Logs de erro (aparecem no console E são gravados em arquivo)
      Logger.error("Falha na conexão com banco de dados")
      Logger.critical("Sistema em estado crítico")

      # Limpeza de logs antigos (manter apenas últimos 30 dias)
      DeeperHub.Core.Logger.cleanup_old_logs(30)
  """

  require Logger
  import IO.ANSI

  @logs_dir "logs"

  @doc """
  Limpa arquivos de log mais antigos que o número especificado de dias.
  """
  @spec cleanup_old_logs(integer()) :: :ok
  def cleanup_old_logs(days_to_keep \\ 30) do
    ensure_logs_directory()

    cutoff_date = Date.utc_today() |> Date.add(-days_to_keep)

    case File.ls(@logs_dir) do
      {:ok, files} ->
        files
        |> Enum.filter(&String.starts_with?(&1, "error_"))
        |> Enum.filter(&String.ends_with?(&1, ".log"))
        |> Enum.each(fn filename ->
          # Extrair data do nome do arquivo (formato: error_YYYY-MM-DD.log)
          case Regex.run(~r/error_(\d{4}-\d{2}-\d{2})\.log/, filename) do
            [_, date_str] ->
              case Date.from_iso8601(date_str) do
                {:ok, file_date} ->
                  if Date.compare(file_date, cutoff_date) == :lt do
                    filepath = Path.join(@logs_dir, filename)
                    File.rm(filepath)
                    IO.puts("[LOGGER] Removido log antigo: #{filename}")
                  end
                {:error, _} -> :ok
              end
            _ -> :ok
          end
        end)
      {:error, _} -> :ok
    end

    :ok
  end

  @doc """
  Retorna o caminho do diretório de logs.
  """
  @spec logs_directory() :: String.t()
  def logs_directory, do: @logs_dir

  @doc """
  Registra uma mensagem de log no nível :debug.
  """
  @spec debug(any(), keyword()) :: :ok
  defmacro debug(message, metadata \\ []) do
    caller_module_atom = __CALLER__.module

    quote do
      DeeperHub.Core.Logger.__log__(
        :debug,
        unquote(message),
        Keyword.put(unquote(metadata), :module, unquote(caller_module_atom))
      )
    end
  end

  @doc """
  Registra uma mensagem de log no nível :info.
  """
  @spec info(any(), keyword()) :: :ok
  defmacro info(message, metadata \\ []) do
    caller_module_atom = __CALLER__.module

    quote do
      DeeperHub.Core.Logger.__log__(
        :info,
        unquote(message),
        Keyword.put(unquote(metadata), :module, unquote(caller_module_atom))
      )
    end
  end

  @doc """
  Registra uma mensagem de log no nível :warning. (Anteriormente :warn)
  """
  @spec warning(any(), keyword()) :: :ok # Mudança de nome e @spec
  defmacro warning(message, metadata \\ []) do # Mudança de nome da macro
    caller_module_atom = __CALLER__.module

    quote do
      DeeperHub.Core.Logger.__log__(
        :warning, # Mudança para :warning
        unquote(message),
        Keyword.put(unquote(metadata), :module, unquote(caller_module_atom))
      )
    end
  end

  # Manter a macro :warn por retrocompatibilidade, mas ela chamará :warning e emitirá um aviso de depreciação no log
  @doc """
  [DEPRECIADO] Registra uma mensagem de log no nível :warning. Use `warning/2` em vez disso.
  """
  @deprecated "Use warning/2 instead"
  @spec warn(any(), keyword()) :: :ok
  defmacro warn(message, metadata \\ []) do
    caller_module_atom = __CALLER__.module

    quote do
      # Log interno avisando sobre a depreciação
      Logger.warning("[DEPRECATION] DeeperHub.Core.Logger.warn/2 is deprecated. Please use warning/2. Called from: #{inspect(unquote(caller_module_atom))}")
      # Chama a nova macro :warning
      DeeperHub.Core.Logger.__log__(
        :warning, # Loga como :warning
        unquote(message),
        Keyword.put(unquote(metadata), :module, unquote(caller_module_atom))
      )
    end
  end


  @doc """
  Registra uma mensagem de log no nível :error.
  """
  @spec error(any(), keyword()) :: :ok
  defmacro error(message, metadata \\ []) do
    caller_module_atom = __CALLER__.module

    quote do
      DeeperHub.Core.Logger.__log__(
        :error,
        unquote(message),
        Keyword.put(unquote(metadata), :module, unquote(caller_module_atom))
      )
    end
  end

  @doc """
  Registra uma mensagem de log no nível :critical.
  """
  @spec critical(any(), keyword()) :: :ok
  defmacro critical(message, metadata \\ []) do
    caller_module_atom = __CALLER__.module

    quote do
      DeeperHub.Core.Logger.__log__(
        :critical,
        unquote(message),
        Keyword.put(unquote(metadata), :module, unquote(caller_module_atom))
      )
    end
  end

  @doc false
  @spec __log__(atom(), any(), keyword()) :: :ok
  def __log__(level, message_content, metadata) do
    try do
      # Respeita o nível de log configurado globalmente
      # O Logger do Elixir trata :warn e :warning como o mesmo nível internamente para comparação
      # mas é bom usar :warning consistentemente.
      effective_level = if level == :warn, do: :warning, else: level

      if Logger.compare_levels(effective_level, Logger.level()) != :lt do
        datetime = DateTime.utc_now()
        date_str = datetime |> DateTime.to_date() |> Date.to_string()
        time_str = datetime |> DateTime.to_time() |> Time.to_string() |> String.slice(0, 8)
        timestamp = "#{date_str} #{time_str}"

        module_name_atom = metadata[:module] || :UnknownModule
        module_name_str = Atom.to_string(module_name_atom)

        date_color = yellow()
        module_text_color = blue() <> bright()
        reset_color = reset() # Renomeado para clareza

        level_message_color_map = %{
          :debug => cyan(),
          :info => green(),
          :warning => magenta(), # Usando :warning como chave
          :error => red(),
          :critical => red() <> bright()
        }

        message_color = Map.get(level_message_color_map, effective_level, default_color())

        metadata_str =
          if Enum.empty?(metadata) or Keyword.keys(metadata) == [:module] do
            ""
          else
            metadata_without_module = Keyword.delete(metadata, :module)
            " " <> inspect(metadata_without_module)
          end

        log_parts = [
          date_color,
          timestamp,
          reset_color,
          " ",
          "[",
          module_text_color,
          module_name_str,
          reset_color,
          "]",
          " ",
          message_color,
          formatar_conteudo_mensagem(message_content),
          reset_color,
          metadata_str
        ]

        IO.puts(log_parts)

        # Gravar erros e críticos em arquivo
        if effective_level in [:error, :critical] do
          formatted_message = formatar_conteudo_mensagem(message_content)
          write_error_to_file(timestamp, module_name_str, formatted_message)
        end
      end

      :ok
    rescue
      e ->
        IO.puts("[LOGGER ERROR] Falha ao registrar log: #{Exception.message(e)}")
        :ok
    end
  end

  @doc false
  @spec formatar_conteudo_mensagem(any()) :: String.t()
  defp formatar_conteudo_mensagem(message) when is_binary(message), do: message
  defp formatar_conteudo_mensagem(message), do: inspect(message, pretty: true, limit: 5000)

  @doc false
  @spec ensure_logs_directory() :: :ok
  defp ensure_logs_directory do
    case File.mkdir_p(@logs_dir) do
      :ok -> :ok
      {:error, reason} ->
        IO.puts("[LOGGER ERROR] Falha ao criar diretório de logs: #{inspect(reason)}")
        :ok
    end
  end

  @doc false
  @spec write_error_to_file(String.t(), String.t(), String.t()) :: :ok
  defp write_error_to_file(timestamp, module_name, message) do
    ensure_logs_directory()

    date = Date.utc_today() |> Date.to_string()
    filename = "error_#{date}.log"
    filepath = Path.join(@logs_dir, filename)

    log_entry = "#{timestamp} [#{module_name}] #{message}\n"

    case File.write(filepath, log_entry, [:append, :utf8]) do
      :ok -> :ok
      {:error, reason} ->
        IO.puts("[LOGGER ERROR] Falha ao escrever no arquivo de log: #{inspect(reason)}")
        :ok
    end
  end

  @doc """
  Função de teste para demonstrar o sistema de logging com gravação em arquivo.
  Esta função gera logs de diferentes níveis para testar a funcionalidade.
  """
  @spec test_logging() :: :ok
  def test_logging do
    IO.puts("=== Testando Sistema de Logging ===")

    # Logs que aparecem apenas no console
    debug("Mensagem de debug - apenas console", test: true)
    info("Sistema de logging inicializado", test: true)
    warning("Este é um aviso de teste", test: true)

    # Logs que aparecem no console E são gravados em arquivo
    error("Erro de teste - será gravado em arquivo", test: true)
    critical("Erro crítico de teste - será gravado em arquivo", test: true)

    IO.puts("=== Teste concluído ===")
    IO.puts("Verifique o diretório 'logs/' para ver os arquivos de erro gerados.")

    :ok
  end
end
# </file>
