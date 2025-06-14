defmodule DeeperHub.Core.Auth.SimpleHash do
  @moduledoc """
  Módulo simples de hash usando :crypto do Erlang/Elixir.
  Não requer compilação de bibliotecas externas.
  """

  use Bitwise

  @salt_length 16

  @doc """
  Gera hash de uma senha com salt.
  """
  def hash_password(password) when is_binary(password) do
    salt = generate_salt()
    hash = hash_with_salt(password, salt)
    "#{Base.encode64(salt)}$#{Base.encode64(hash)}"
  end

  @doc """
  Verifica se uma senha corresponde ao hash.
  """
  def verify_password(password, hash) when is_binary(password) and is_binary(hash) do
    try do
      case String.split(hash, "$") do
        [salt_b64, hash_b64] ->
          with {:ok, salt} <- Base.decode64(salt_b64),
               {:ok, stored_hash} <- Base.decode64(hash_b64) do
            computed_hash = hash_with_salt(password, salt)
            secure_compare(computed_hash, stored_hash)
          else
            _ -> false
          end

        _ ->
          # Fallback para senhas em texto plano (desenvolvimento)
          password == hash
      end
    rescue
      _ -> false
    end
  end

  @doc """
  Simula verificação de senha para evitar timing attacks.
  """
  def no_user_verify do
    # Simula o tempo de verificação de hash
    dummy_hash = hash_password("dummy_password")
    verify_password("dummy", dummy_hash)
    false
  end

  # Funções privadas

  defp generate_salt do
    :crypto.strong_rand_bytes(@salt_length)
  end

  defp hash_with_salt(password, salt) do
    # Usa PBKDF2 com SHA256 (disponível no :crypto)
    :crypto.pbkdf2_hmac(:sha256, password, salt, 10000, 32)
  end

  defp secure_compare(a, b) when byte_size(a) == byte_size(b) do
    # Comparação segura contra timing attacks
    a
    |> :binary.bin_to_list()
    |> Enum.zip(:binary.bin_to_list(b))
    |> Enum.reduce(0, fn {x, y}, acc -> bor(acc, bxor(x, y)) end)
    |> Kernel.==(0)
  end

  defp secure_compare(_, _), do: false
end
