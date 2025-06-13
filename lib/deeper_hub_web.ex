defmodule DeeperHubWeb do
  @moduledoc """
  Módulo base para recursos web do DeeperHub.
  """

  def resource do
    quote do
      use Plug.Router
      import Plug.Conn

      plug :match
      plug :dispatch

      # Helper para resposta JSON
      defp json(conn, data) do
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(conn.status || 200, Jason.encode!(data))
      end
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
