defmodule QRZ.Schema.QRZDatabase do
  @moduledoc false

  import DataSchema, only: [data_schema: 1]
  alias QRZ.Schema.Session
  alias QRZ.Schema.Callsign
  alias QRZ.Schema.DXCC

  @data_accessor QRZ.XpathAccessor

  data_schema(
    field: {:version, "/QRZDatabase/@version", &{:ok, to_string(&1)}},
    has_one: {:session, "/QRZDatabase/Session", Session},
    has_one: {:callsign, "/QRZDatabase/Callsign", Callsign, optional?: true},
    has_one: {:dxcc, "/QRZDatabase/DXCC", DXCC, optional?: true}
  )
end
