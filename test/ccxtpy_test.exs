defmodule CcxtpyTest do
  import Ccxtpy
  use ExUnit.Case
  doctest Ccxtpy

  @pid Ccxtpy.Port

  test "fetches ohlcvs from bitfinex2" do
    exchange = "bitfinex2"
    symbol = "ETH/USDT"
    timeframe = "1h"
    since = ~N[2018-01-01T00:00:00]
    limit = 1000
    ohlcvs = fetch_ohlcvs(@pid, exchange, symbol, timeframe, since, limit)
    assert %{base: _, high: _, base_volume: _} = hd(ohlcvs)
  end

  test "fetches ohlcvs from poloniex" do
    exchange = "poloniex"
    symbol = "ETH/USDT"
    timeframe = "1h"
    since = ~N[2018-01-01T00:00:00]
    limit = 1000
    ohlcvs = fetch_ohlcvs(@pid, exchange, symbol, timeframe, since, limit)
    assert %{base: _, high: _, base_volume: _} = hd(ohlcvs)
  end


  test "fetches ohlcvs without since or limit args" do
    exchange = "kuna"
    symbol = "BTC/UAH"
    timeframe = "1h"
    ohlcvs = fetch_ohlcvs(@pid, exchange, symbol, timeframe, nil, nil)
    assert %{base: _, high: _, base_volume: _} = hd(ohlcvs)
  end

  test "fetches exchanges list" do
    exchanges = exchanges(@pid)
    assert %{has: _, id: _, timeout: _} = exchanges["bitfinex2"]
  end

  test "fetch bitfinex ticker" do
    exchange = "bitstamp"
    symbol = "ETH/USD"
    ticker = fetch_ticker(@pid, exchange, symbol)
    assert %{base: _, high: _, base_volume: _} = ticker
  end
end
