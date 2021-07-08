class BinanceService
  require 'faraday'
  URI = 'https://api.binance.com/api/v3/klines'

  def self.get_klines(symbol, interval)
    response = Faraday.get(URI, { symbol: symbol, interval: interval })
    puts response.status
    # return 'Error' unless response.status == 200

    JSON.parse(response.body)
  end

  # def call_api()
  #   response = Faraday.get(URI, { symbol: symbol, interval: interval })
  # end
end
