defmodule Ccxtex.NextTest do
  import Ccxtex.Next
  use ExUnit.Case, async: true
  alias Ccxtex.Ticker
  doctest Ccxtex

  test "returns exchanges list" do
    {:ok, exchanges} = exchanges()
    assert "poloniex" in exchanges and "bitfinex" in exchanges
  end

  test "fetches ohlcvs from poloniex" do
    opts =
      Ccxtex.OHLCVS.Opts.make!(%{
        exchange: "poloniex",
        base: "ETH",
        quote: "USDT",
        timeframe: "1h",
        since: ~N[2018-01-01T00:00:00],
        limit: 100
      })

    {:ok, ohlcvs} = fetch_ohlcvs(opts)
    assert length(hd(ohlcvs)) == 6
  end

  test "fetches ohlcvs from bitfinex2" do
    opts =
      Ccxtex.OHLCVS.Opts.make!(%{
        exchange: "bitfinex2",
        base: "ETH",
        quote: "USDT",
        timeframe: "1h",
        since: ~N[2018-01-01T00:00:00],
        limit: 100
      })

    {:ok, ohlcvs} = fetch_ohlcvs(opts)
    assert length(hd(ohlcvs)) == 6
  end

  test "fetch bitfinex ticker" do
    exchange = "bitstamp"
    base = "ETH"
    quote = "USD"
    {:ok, ticker} = fetch_ticker(exchange, base, quote)
    assert %Ticker{ask: _, bid: _, vwap: _} = ticker
  end


end