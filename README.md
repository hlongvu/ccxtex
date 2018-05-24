# Ccxtex

Ccxtex provides easy Elixir/Erlang interop with python ccxt library that provides unified API to access hisorical data and trading operations for multiple cryptoexchanges.

## Installation


```elixir
def deps do
  [
    {:ccxtpy, github: "cyberpunk-ventures/ccxt_port"}
  ]
end
```

## Status

Ccxtex is under active development, API is unstable and will change.

* Public APIs in progress

- [x] get_ticker
- [x] get_ohlcv
- [x] exchanges
- [x] fetch_markets
- [x] fetch_trades
- [ ] fetch_order_book
- [ ] fetch_l2_order_book

* Developer experience improvements

- [] unified public API call option structs
- [] integrate python 3 async calls and remove a pid arg from module functions
- [] capture exceptions generated by ccxt python library and convert to elixir success tuples

* Private APIs under consideration

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ccxtpy](https://hexdocs.pm/ccxtpy).
