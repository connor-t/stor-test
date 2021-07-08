class HomeController < ApplicationController
  def index
    @intervals = BinanceService::INTERVALS
    @data = nil
    @data = BinanceService.get_klines(params[:stock], params[:interval]) if params[:stock] && params[:interval]
    respond_to do |format|
      format.html
    end
  end
end
