require 'rails_helper'

RSpec.describe BinanceService do
  describe '#get_klines' do
    let(:klines_response) { BinanceService.get_klines('ADABNB', '1h') }
    it "returns the kline data with the correct params" do
      expect(klines_response).to be_kind_of(Array)
    end

    let(:klines_response_error) { BinanceService.get_klines('ADABNBx', '1m') }
    it "returns the error message with incorrect params" do
      expect(klines_response_error).to be_kind_of(Hash)
      expect(klines_response_error).to have_key("code")
      expect(klines_response_error).to have_key("msg")
    end
  end
end