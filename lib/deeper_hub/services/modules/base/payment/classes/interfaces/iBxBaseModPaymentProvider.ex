defmodule IBxBaseModPaymentProvider do
  @moduledoc """
  * Copyright (c) UNA, Inc - https://una.io
   * MIT License - https://opensource.org/licenses/MIT
   *
   * \\@defgroup    BasePayment Base classes for Payment like modules
   * \\@ingroup     UnaModules
   *
   * \\@{
  """

  @doc """
  Funcao correspondente ao metodo PHP initializeCheckout
  """
  def initializeCheckout(_params) do
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP finalizeCheckout
  """
  def finalizeCheckout(_params) do
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP finalizedCheckout
  """
  def finalizedCheckout(_params) do
    :ok
  end
end
