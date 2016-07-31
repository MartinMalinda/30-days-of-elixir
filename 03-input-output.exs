# TODO: add proper {:error} returns

defmodule Forecast do
  def temperature_for_day(day) when day > -1 and day < 120 do
    day / 365 * 25
  end

  def temperature_for_day(day) when day > 119 and day < 365 do
    (365 - day) / 365 * 25
  end

  def temperature_for_day(_), do: IO.puts "invalid input"

  def check_input(input) do
    try do
      String.to_integer(input)
    rescue
       e in ArgumentError -> "invalid input"
       "invalid input"
    end
  end

  def get_forecast(input) do
    input
      |> String.replace("\n", "")
      |> check_input
      |> temperature_for_day
      |> IO.puts
  end

  def init do
    day = IO.gets "Enter a day(0 - 364) to get a forecast: "

    get_forecast day

  end
end

ExUnit.start

defmodule ForecastTest do
  use ExUnit.Case

  test "bad input is caught" do
    assert Forecast.get_forecast("000043424s") == "invalid input"
  end

  test "temp is calculated correctly" do
    assert Forecast.get_forecast(0) == 0
    assert Forecast.get_forecast(364) == 1/365 * 25
  end

  test "bad day number is caught" do
    assert Forecast.get_forecast("400") == "invalid input"
  end
end

Forecast.init