defmodule QRZ do
  @moduledoc """
  QRZ.com XML Data Service client for amateur radio callsign and DXCC lookups
  """

  @doc """
  Login and get session info to make queries

  ## Parameters
    - username: QRZ.com username
    - password: QRZ.com password

  ## Examples

      iex> QRZ.login("username", "password")
      {:ok,
        %QRZ.Schema.Session{
          key: "d0cf9d7b3b937ed5f5de28ddf5a0122d",
          count: "6115",
          sub_exp: "Sat Mar  8 00:00:00 2025",
          gmt_time: "Wed Oct 18 16:50:55 2023",
          message: "",
          error: ""
        }}


      iex> QRZ.login("bad_username", "bad_password")
      {:error, "Username/password incorrect "}

  """
  def login(username, password) do
    QRZ.API.login(username, password)
  end

  @doc """
  Callsign lookup

  ## Parameters
    - key: QRZ.com session key (returned from login/2 function)
    - callsign: amateur radio callsign to lookup

  ## Examples

      iex> QRZ.callsign("d0cf9d7b...", "aa7bq")
      {:ok,
        %QRZ.Schema.Callsign{
          call: "AA7BQ",
          xref: "",
          aliases: "N6UFT,AA7BQ/DL1,KJ6RK,AA7BQ/HR6",
          dxcc: "291",
          first_name: "FRED L",
          last_name: "LLOYD",
          addr1: "101 Radio Wave Lane",
          addr2: "Phoenix",
          state: "AZ",
          zip: "85013",
          country: "United States",
          ccode: "271",
          lat: "33.0",
          lon: "-112.0",
          grid: "DM33xm",
          county: "Maricopa",
          fips: "04013",
          land: "United States",
          ef_date: "2022-04-29",
          exp_date: "2030-01-20",
          p_call: "",
          class: "E",
          codes: "HAI",
          qsl_mgr: "via QRZ",
          email: "aa7bq@example.com",
          url: "",
          u_views: "335829",
          bio: "12804",
          image: "https://cdn-xml.qrz.com/q/aa7bq/fred1962.jpg",
          image_info: "636:800:90801",
          serial: "",
          mod_date: "2022-10-09 17:32:38",
          msa: "6200",
          area_code: "602",
          timezone: "Mountain",
          gmt_offset: "-7",
          dst: "N",
          eqsl: "0",
          mqsl: "0",
          cq_zone: "3",
          itu_zone: "6",
          born: "1953",
          user: "AA7BQ",
          lotw: "0",
          iota: "",
          geoloc: "user",
          attn: "AA7BQ",
          nickname: "",
          name_fmt: "FRED L LLOYD"
        }}


      iex> QRZ.callsign("d0cf9d7b...", "N0CALL")
      {:error, "Not found: N0CALL"}

  """
  def callsign(key, callsign) do
    QRZ.API.callsign(key, callsign)
  end

  @doc """
  DXCC entity lookup

  ## Parameters
    - key: QRZ.com session key (returned from login/2 function)
    - dxcc: lookup dxcc entity by entity code or by callsign

  ## Examples

      iex> QRZ.dxcc("d0cf9d7b...", "291")
      {:ok,
        %QRZ.Schema.DXCC{
          dxcc: "291",
          cc: "US",
          ccc: "USA",
          name: "United States",
          continent: "NA",
          itu_zone: "0",
          cq_zone: "0",
          timezone: "-5",
          lat: "37.701207",
          lon: "-97.316895",
          notes: ""
        }}


      iex> QRZ.dxcc("d0cf9d7b...", "aa7bq")
      {:ok,
        %QRZ.Schema.DXCC{
          dxcc: "291",
          cc: "US",
          ccc: "USA",
          name: "United States",
          continent: "NA",
          itu_zone: "0",
          cq_zone: "0",
          timezone: "-5",
          lat: "37.701207",
          lon: "-97.316895",
          notes: ""
        }}

  """
  def dxcc(key, dxcc) do
    QRZ.API.dxcc(key, dxcc)
  end
end
