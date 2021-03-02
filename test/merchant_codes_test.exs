defmodule MerchantCodesTest do
  use ExUnit.Case
  doctest MerchantCodes

  test "gets info for a valid mcc" do
    assert MerchantCodes.get("3072") == %{
             combined_description: "Airlines",
             edited_description: "Airlines",
             id: 86,
             irs_description: "Airlines",
             irs_reportable: "Yes",
             mcc: "3072",
             usda_description: ""
           }
  end

  test "returns nil info for invalid mcc" do
    assert MerchantCodes.get("") == nil
  end

  test "gets the category for a valid mcc" do
    assert MerchantCodes.category("3011") == "Airlines"
  end

  test "returns nil category for invalid mcc" do
    assert MerchantCodes.category("") == nil
  end
end
