class Kline
  include ActiveModel::Model

  def self.moving_average(data)
    sum = 0
    data.each { |a| sum += a[4].to_f }
    sum / data.length
  end
end
