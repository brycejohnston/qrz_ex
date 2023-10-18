defmodule QRZ.Schema.DXCC do
  @moduledoc false

  import DataSchema, only: [data_schema: 1]

  @data_accessor QRZ.XpathAccessor

  data_schema(
    field: {:dxcc, "./dxcc/text()", &{:ok, to_string(&1)}},
    field: {:cc, "./cc/text()", &{:ok, to_string(&1)}},
    field: {:ccc, "./ccc/text()", &{:ok, to_string(&1)}},
    field: {:name, "./name/text()", &{:ok, to_string(&1)}},
    field: {:continent, "./continent/text()", &{:ok, to_string(&1)}},
    field: {:itu_zone, "./ituzone/text()", &{:ok, to_string(&1)}},
    field: {:cq_zone, "./cqzone/text()", &{:ok, to_string(&1)}},
    field: {:timezone, "./timezone/text()", &{:ok, to_string(&1)}},
    field: {:lat, "./lat/text()", &{:ok, to_string(&1)}},
    field: {:lon, "./lon/text()", &{:ok, to_string(&1)}},
    field: {:notes, "./notes/text()", &{:ok, to_string(&1)}}
  )
end
