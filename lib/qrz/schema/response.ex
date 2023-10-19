defmodule QRZ.Response do
  @moduledoc false

  import DataSchema, only: [data_schema: 1]
  alias QRZ.Session
  alias QRZ.Callsign
  alias QRZ.DXCC

  @data_accessor QRZ.XpathAccessor

  data_schema(
    field: {:version, "/QRZDatabase/@version", &{:ok, to_string(&1)}},
    has_one: {:session, "/QRZDatabase/Session", Session, optional?: true},
    has_one: {:callsign, "/QRZDatabase/Callsign", Callsign, optional?: true},
    has_one: {:dxcc, "/QRZDatabase/DXCC", DXCC, optional?: true}
  )
end
