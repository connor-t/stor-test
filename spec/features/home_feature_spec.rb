require 'rails_helper'

describe 'home page', type: :feature do
  it 'returns the moving average for a symbol' do
    visit '/'
    within('#search') do
      fill_in 'Symbol', with: 'ADABNB'
      select '1h', from: 'interval'
    end
    click_button 'Search'
    expect(page).to have_content 'Symbol: ADABNB Interval: 1h Moving Average: 0.5'
  end

  it 'returns an error with an invalid symbol' do
    visit '/'
    within('#search') do
      fill_in 'Symbol', with: 'ADABNBx'
      select '1m', from: 'interval'
    end
    click_button 'Search'
    expect(page).to have_content 'Error: Invalid symbol.'
  end
end
