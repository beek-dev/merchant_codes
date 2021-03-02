# Merchant Codes

Search for merchant category info with Merchant Category Codes (MCCs).

_Built by [Beek Technologies](https://beek.com.au/) 🕊_

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `merchant_codes` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:merchant_codes, "~> 0.1.0"}
  ]
end
```

## Usage

To return a map of MCC info, simply run:

```bash
iex> MerchantCodes.get("3072")
%{
  combined_description: "Agricultural Co-operatives",
  edited_description: "Agricultural Co-operatives",
  id: 1,
  irs_description: "Agricultural Cooperative",
  irs_reportable: "Yes",
  mcc: "0763",
  usda_description: "Agricultural Co-operatives"
}
```

If you're just looking for a category using a code:

```bash
iex> MerchantCodes.category("3072")
"Agricultural Cooperative"
```

## Additional links

- Inspired by [https://github.com/christophior/mcc](https://github.com/christophior/mcc).

- [What are Merchant Category Codes?](https://en.wikipedia.org/wiki/Merchant_category_code)

- [Stripe's MCCs](https://stripe.com/docs/issuing/categories)

- See our [Documentation](https://hexdocs.pm/merchant_codes).
