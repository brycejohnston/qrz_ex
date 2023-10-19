# QRZ

[![hex.pm](https://img.shields.io/hexpm/v/qrz.svg)](https://hex.pm/packages/qrz)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/qrz/)
[![hex.pm](https://img.shields.io/hexpm/dt/qrz.svg)](https://hex.pm/packages/qrz)
[![hex.pm](https://img.shields.io/hexpm/l/qrz.svg)](https://hex.pm/packages/qrz)

[QRZ.com](https://www.qrz.com) elixir client for amateur radio callsign and DXCC lookups through their [XML Data Service](https://www.qrz.com/XML/current_spec.html).

Queries require a QRZ account with an active [XML Logbook Data Subscription](https://shop.qrz.com/).

## Installation

The package can be installed by adding qrz to your list of dependencies in mix.exs:

```elixir
def deps do
  [
    {:qrz, "~> 0.1.2"}
  ]
end
```

## Usage
 
See the [QRZ module documentation](https://hexdocs.pm/qrz/QRZ.html) for additional details.

### Login

Login to get session key to use for lookups. Queries that result in session expiration will return an error tuple denoting it, requiring a login call to get a new session key.   

```elixir
{:ok, session} = QRZ.login("username", "password")
#=> 
# {:ok,
#   %QRZ.Session{
#     key: "d0cf9d7b3b937ed5f5de28ddf5a0122d",
#     count: "6124",
#     sub_exp: "Sat Mar  8 00:00:00 2025",
#     gmt_time: "Wed Oct 18 17:09:55 2023",
#     message: "",
#     error: ""
#   }}

session.key
#=> "d0cf9d7b3b937ed5f5de28ddf5a0122d"
```

### Callsign Lookup

Lookup callsign information.

*Note: Currently every field is returned as a string, future versions may cast numerical and date related values in the future.*

```elixir
{:ok, callsign} = QRZ.callsign(session.key, "aa7bq")
#=> 
# {:ok,
#   %QRZ.Callsign{
#     call: "AA7BQ",
#     xref: "",
#     aliases: "N6UFT,AA7BQ/DL1,KJ6RK,AA7BQ/HR6",
#     dxcc: "291",
#     first_name: "FRED L",
#     last_name: "LLOYD",
#     ...
#   }}

callsign.call
#=> "AA7BQ"

callsign.email
#=> "aa7bq@example.com"
```

### DXCC Lookup

Lookup DXCC entity information by entity code or callsign

```elixir
{:ok, dxcc} = QRZ.dxcc(session.key, "291")
#=> 
# {:ok,
#   %QRZ.DXCC{
#     dxcc: "291",
#     cc: "US",
#     ccc: "USA",
#     name: "United States",
#     continent: "NA",
#     itu_zone: "0",
#     cq_zone: "0",
#     timezone: "-5",
#     lat: "37.701207",
#     lon: "-97.316895",
#     notes: ""
#   }}

dxcc.lat
#=> "37.701207"

dxcc.timezone
#=> "-5"
```


