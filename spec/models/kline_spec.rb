require 'rails_helper'

RSpec.describe Kline, type: :model  do
  describe '#moving_average' do
    let(:data) do
      [[1_623_985_200_000, '0.00420100', '0.00420400', '0.00416500', '0.4'],
       [1_623_985_200_000, '0.00420100', '0.00420400', '0.00416500', '0.5'],
       [1_623_985_200_000, '0.00420100', '0.00420400', '0.00416500', '0.6']]
    end
    it 'calculates the moving average' do
      expect(Kline.moving_average(data)).to eq(0.5)
    end
  end
end
