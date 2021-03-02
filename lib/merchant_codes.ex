defmodule MerchantCodes do
  @moduledoc """
  'MerchantCodes' lets you find Merchant Category Code (MCC) info and categories based on a code.
  """

  @doc """
  Get MCC information by a code.

  ## Examples

      iex> MerchantCodes.get("0763")
      %{
        combined_description: "Agricultural Co-operatives",
        edited_description: "Agricultural Co-operatives",
        id: 1,
        irs_description: "Agricultural Cooperative",
        irs_reportable: "Yes",
        mcc: "0763",
        usda_description: "Agricultural Co-operatives"
      }

  """
  @spec get(String.t()) :: %{
          combined_description: String.t(),
          edited_description: String.t(),
          id: integer(),
          irs_description: String.t(),
          irs_reportable: String.t(),
          mcc: String.t(),
          usda_description: String.t()
        }
  def get(mcc_code) do
    with {:ok, mcc_codes} <- decode_mcc_json("mcc.json"),
         %{} = mcc <- Enum.find(mcc_codes, fn map -> map["mcc"] == mcc_code end) do
      Map.new(mcc, fn {k, v} -> {String.to_atom(k), v} end)
    else
      _ -> nil
    end
  end

  @doc """
  Get name of an MCC by its code.

  ## Examples

      iex> MerchantCodes.category("0763")
      "Agricultural Cooperative"
  """
  @spec category(String.t()) :: String.t()
  def category(mcc_code) do
    with %{} = code <- MerchantCodes.get(mcc_code) do
      code.irs_description
    else
      _ ->
        nil
    end
  end

  @doc false
  @spec decode_mcc_json(String.t()) :: {:error, atom | Jason.DecodeError.t()} | {:ok, any}
  defp decode_mcc_json(filename) do
    with {:ok, body} <- File.read(filename), {:ok, json} <- Jason.decode(body), do: {:ok, json}
  end
end
