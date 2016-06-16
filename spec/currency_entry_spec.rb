require 'spec_helper'

describe LightCurrencyConverter::CurrencyEntry do
  it 'it should have the right attributes' do
    entry = LightCurrencyConverter::CurrencyEntry.new(6, "BGN")
    expect(entry).to respond_to(:value, :currency)
  end
end
