class HomeController < ApplicationController
  def index
    @intervals = BinanceService::INTERVALS
    if params[:stock] && params[:interval]
      klines = BinanceService.get_klines(params[:stock], params[:interval])
      @error_message = klines[:error]
      @moving_average = Kline.moving_average(klines[:data]) unless klines[:data].nil?
    end
    respond_to do |format|
      format.html
    end
  end
end
