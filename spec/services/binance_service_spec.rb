require 'rails_helper'

RSpec.describe BinanceService do
  describe '#get_klines' do
    let(:klines_response) { BinanceService.get_klines('ADABNB', '1h') }
    it "returns the kline data with the correct params" do
      expect(klines_response[:data]).to be_kind_of(Array)
      expect(klines_response[:data]).not_to be_nil
    end

    let(:klines_response_error) { BinanceService.get_klines('ADABNBx', '1m') }
    it "returns the error message with incorrect params" do
      expect(klines_response_error[:error]).not_to be_nil
    end
  end
end