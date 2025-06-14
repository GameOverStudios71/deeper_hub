defmodule DeeperHub.Dev.HotReload do
  @moduledoc """
  Sistema de hot reload para desenvolvimento.
  Monitora mudanças nos arquivos e recompila automaticamente.
  """
  use GenServer
  require Logger

  @watched_dirs [
    "lib",
    "client/js",
    "client/css",
    "client/index.html"
  ]

  @watched_extensions [
    ".ex",
    ".exs",
    ".js",
    ".css",
    ".html"
  ]

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    if Mix.env() == :dev do
      Logger.info("🔥 Hot Reload ativado - monitorando mudanças...")

      # Iniciar o FileSystem watcher
      {:ok, watcher_pid} = FileSystem.start_link(dirs: @watched_dirs)
      FileSystem.subscribe(watcher_pid)

      {:ok, %{watcher_pid: watcher_pid, last_reload: System.monotonic_time()}}
    else
      Logger.info("Hot Reload desabilitado (não está em modo dev)")
      {:ok, %{}}
    end
  end

  def handle_info({:file_event, watcher_pid, {path, events}}, %{watcher_pid: watcher_pid} = state) do
    if should_reload?(path, events) do
      debounced_reload(state)
    end

    {:noreply, state}
  end

  def handle_info({:file_event, watcher_pid, :stop}, %{watcher_pid: watcher_pid} = state) do
    Logger.info("FileSystem watcher parou")
    {:noreply, state}
  end

  def handle_info(:reload, state) do
    perform_reload()
    {:noreply, %{state | last_reload: System.monotonic_time()}}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end

  defp should_reload?(path, events) do
    # Verificar se é um arquivo que devemos monitorar
    extension = Path.extname(path)

    # Verificar se tem a extensão correta
    has_valid_extension = extension in @watched_extensions

    # Verificar se não é um arquivo temporário
    is_not_temp = not String.contains?(path, [".#", "~", ".tmp", ".swp"])

    # Verificar se é um evento de modificação ou criação
    is_modify_event = :modified in events or :created in events

    has_valid_extension and is_not_temp and is_modify_event
  end

  defp debounced_reload(state) do
    # Debounce para evitar múltiplos reloads
    current_time = System.monotonic_time()
    time_diff = System.convert_time_unit(current_time - state.last_reload, :native, :millisecond)

    if time_diff > 500 do  # 500ms de debounce
      Process.send_after(self(), :reload, 100)  # Pequeno delay para garantir que o arquivo foi salvo
    end
  end

  defp perform_reload do
    Logger.info("🔄 Detectada mudança nos arquivos - recompilando...")

    # Recompilar o projeto
    result = Mix.Task.run("compile", ["--force"])

    case result do
      :ok ->
        Logger.info("✅ Recompilação concluída com sucesso!")
        broadcast_reload_event()

      :noop ->
        Logger.info("✅ Nenhuma mudança detectada para recompilação")
        broadcast_reload_event()

      {:error, _} ->
        Logger.error("❌ Erro na recompilação")

      _ ->
        Logger.info("✅ Recompilação processada (#{inspect(result)})")
        broadcast_reload_event()
    end
  end

  defp broadcast_reload_event do
    # Por enquanto apenas log, mas pode ser expandido para WebSocket
    Logger.info("📡 Notificando clientes sobre reload...")
  end

  def terminate(_reason, %{watcher_pid: watcher_pid}) when is_pid(watcher_pid) do
    # O FileSystem será automaticamente parado quando o processo terminar
    :ok
  end

  def terminate(_reason, _state), do: :ok
end
