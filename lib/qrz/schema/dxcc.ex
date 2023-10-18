defmodule QRZ.Schema.DXCC do
  import DataSchema, only: [data_schema: 1]

  @data_accessor QRZ.XpathAccessor

  data_schema(
    field: {:dxcc, "/QRZDatabase/DXCC/dxcc/text()", &{:ok, to_string(&1)}},
    field: {:cc, "/QRZDatabase/DXCC/cc/text()", &{:ok, to_string(&1)}},
    field: {:ccc, "/QRZDatabase/DXCC/ccc/text()", &{:ok, to_string(&1)}},
    field: {:name, "/QRZDatabase/DXCC/name/text()", &{:ok, to_string(&1)}},
    field: {:continent, "/QRZDatabase/DXCC/continent/text()", &{:ok, to_string(&1)}},
    field: {:itu_zone, "/QRZDatabase/DXCC/ituzone/text()", &{:ok, to_string(&1)}},
    field: {:cq_zone, "/QRZDatabase/DXCC/cqzone/text()", &{:ok, to_string(&1)}},
    field: {:timezone, "/QRZDatabase/DXCC/timezone/text()", &{:ok, to_string(&1)}},
    field: {:lat, "/QRZDatabase/DXCC/lat/text()", &{:ok, to_string(&1)}},
    field: {:lon, "/QRZDatabase/DXCC/lon/text()", &{:ok, to_string(&1)}},
    field: {:notes, "/QRZDatabase/DXCC/notes/text()", &{:ok, to_string(&1)}}
  )
end
