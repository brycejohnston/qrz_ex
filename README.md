# QRZ

[![hex.pm](https://img.shields.io/hexpm/v/qrz.svg)](https://hex.pm/packages/qrz)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/qrz/)
[![hex.pm](https://img.shields.io/hexpm/dt/qrz.svg)](https://hex.pm/packages/qrz)
[![hex.pm](https://img.shields.io/hexpm/l/qrz.svg)](https://hex.pm/packages/qrz)

[QRZ.com](https://www.qrz.com) elixir client for amateur radio callsign lookups through their [XML Data Service](https://www.qrz.com/XML/current_spec.html).

## Installation

The package can be installed by adding qrz to your list of dependencies in mix.exs (coming soon):

```elixir
def deps do
  [
    {:qrz, "~> 0.1.0"}
  ]
end
```

You will need a valid QRZ account with at least an active XML Logbook Data Subscription (cheapest subscription plan). 

Add the required values to your config file (preferably load values from env variables)

```elixir
config :qrz,
  username: "qrz_username"
  password: "qrz_password"
```

## Usage

coming soon...


