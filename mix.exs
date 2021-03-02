defmodule MerchantCodes.MixProject do
  use Mix.Project

  def project do
    [
      app: :merchant_codes,
      name: "Merchant Codes",
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: [extras: ["README.md"]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end

  defp description do
    """
    Search for merchant category info with Merchant Category Codes (MCCs).
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*", "mcc.json"],
      maintainers: ["Beek Technologies"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/beek-dev/merchant_codes",
        "Docs" => "https://hexdocs.pm/merchant_codes/readme.html"
      }
    ]
  end
end
