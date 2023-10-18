defmodule QRZ.Schema.Session do
  import DataSchema, only: [data_schema: 1]

  @data_accessor QRZ.XpathAccessor

  data_schema(
    field: {:key, "/QRZDatabase/Session/Key/text()", &{:ok, to_string(&1)}},
    field: {:count, "/QRZDatabase/Session/Count/text()", &{:ok, to_string(&1)}},
    field: {:sub_exp, "/QRZDatabase/Session/SubExp/text()", &{:ok, to_string(&1)}},
    field: {:gmt_time, "/QRZDatabase/Session/GMTime/text()", &{:ok, to_string(&1)}},
    field: {:message, "/QRZDatabase/Session/Message/text()", &{:ok, to_string(&1)}},
    field: {:error, "/QRZDatabase/Session/Error/text()", &{:ok, to_string(&1)}}
  )
end
