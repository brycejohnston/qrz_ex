defmodule QRZ.API do
  @moduledoc false

  @agent "QRZelixir#{QRZ.MixProject.project()[:version]}"
  @qrz_version 1.34

  def login(username, password) do
    get("username=#{username};password=#{password}")
    |> case do
      {:ok, body, _status} ->
        {:ok, body.session}

      {:error, body, _status} ->
        {:error, body}
    end
  end

  def callsign(key, callsign) do
    get("s=#{key};callsign=#{String.upcase(callsign)}")
    |> case do
      {:ok, body, _status} ->
        {:ok, body.callsign}

      {:error, body, _status} ->
        {:error, body}
    end
  end

  def dxcc(key, dxcc) do
    get("s=#{key};dxcc=#{String.upcase(dxcc)}")
    |> case do
      {:ok, body, _status} ->
        {:ok, body.dxcc}

      {:error, body, _status} ->
        {:error, body}
    end
  end

  defp get(query) do
    Req.new(base_url: "https://xmldata.qrz.com/xml/#{@qrz_version}/")
    |> Req.get(url: "?#{query};agent=#{@agent}")
    |> case do
      {:ok, %{status: status, body: body}} ->
        {:ok, body, status}
        |> check_http_errors()

      {:error, %{reason: reason}} ->
        {:error, reason, nil}
    end
  end

  defp check_http_errors({:ok, body, 200}) do
    {:ok, data} = DataSchema.to_struct(body, QRZ.Response)
    check_session_error(data.session.error, data)
  end

  defp check_http_errors({:ok, body, status}) do
    {:error, body, status}
  end

  defp check_session_error("", data) do
    {:ok, data, 200}
  end

  defp check_session_error(nil, data) do
    {:ok, data, 200}
  end

  defp check_session_error(msg, _data) do
    {:error, msg, 200}
  end
end
