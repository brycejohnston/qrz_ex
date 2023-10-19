defmodule QRZ.Session do
  @moduledoc false

  import DataSchema, only: [data_schema: 1]

  @data_accessor QRZ.XpathAccessor

  data_schema(
    field: {:key, "./Key/text()", &{:ok, to_string(&1)}},
    field: {:count, "./Count/text()", &{:ok, to_string(&1)}},
    field: {:sub_exp, "./SubExp/text()", &{:ok, to_string(&1)}},
    field: {:gmt_time, "./GMTime/text()", &{:ok, to_string(&1)}},
    field: {:message, "./Message/text()", &{:ok, to_string(&1)}},
    field: {:error, "./Error/text()", &{:ok, to_string(&1)}}
  )
end
