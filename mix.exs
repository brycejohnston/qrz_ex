defmodule QRZ.MixProject do
  use Mix.Project

  @source_url "https://github.com/brycejohnston/qrz_ex"
  @version "0.1.0"

  def project do
    [
      app: :qrz,
      name: "QRZ",
      version: @version,
      elixir: "~> 1.14",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: "QRZ.com XML Data Service client for amateur radio callsign and DXCC lookups",
      deps: deps(),
      package: package(),
      docs: docs(),
      preferred_cli_env: [docs: :docs]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:req, "~> 0.4.4"},
      {:sweet_xml, "~> 0.7.4"},
      {:data_schema, "~> 0.5.0"},
      {:ex_doc, "~> 0.30.8", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      name: "qrz",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      maintainers: ["Bryce Johnston"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "QRZ",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/qrz",
      source_url: @source_url,
      extras: ["README.md", "LICENSE.md"]
    ]
  end
end
