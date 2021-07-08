class BinanceService
  require 'faraday'
  INTERVALS = %w[1m 1m 3m 5m 15m 30m 1h 2h 4h 6h 8h 12h 1d 3d 1w 1M]
  URI = 'https://api.binance.com/api/v3/klines'

  def self.get_klines(symbol, interval)
    response = Faraday.get(URI, { symbol: symbol, interval: interval })
    JSON.parse(response.body)
  end
end
