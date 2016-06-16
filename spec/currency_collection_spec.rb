require 'spec_helper'

describe LightCurrencyConverter::CurrencyCollection do
  let(:currencies_json) {
    '{
      "1 GBP" : "2.45986 BGN",
      "1 EUR" : "1.95462 BGN",
      "1 USD" : "1.73488 BGN",
      "1 TRY" : "0.59272 BGN",
      "1 CAD" : "1.33794 BGN",
      "1 CHF" : "1.80742 BGN",
      "1 AUD" : "1.27747 BGN",
      "1 DKK" : "0.26287 BGN",
      "100 CZK" : "7.24 BGN"
    }'
  }
  let(:currency_collection) { LightCurrencyConverter::CurrencyCollection.new(currencies_json) }
  it 'Should initialize with the right properties' do
    expect { currency_collection }.not_to raise_error
    expect(currency_collection).to respond_to(:graph, :currencies)
  end

  context 'enumaration methods' do
    it { expect(currency_collection).to respond_to(:each) }
    it { expect(currency_collection[0]).to eq(currency_collection.currencies.first) }
  end

  context 'courses find methods' do
    it 'base find should find two courses by two currencies symbols' do
      expect(currency_collection.base_find('USD', 'BGN')).not_to be_nil
      expect(currency_collection.base_find('BGN', 'USD')).to be_nil
    end

    it 'simple find should find currencies no mather the order of the arguments' do
      expect(currency_collection.simple_find('USD', 'BGN')).not_to be_nil
      expect(currency_collection.simple_find('BGN', 'USD')).not_to be_nil
    end

    context 'find currency course' do
      it 'return CurrencyCourse when direct currency link exists' do
        expect(currency_collection.find_currency_course('USD', 'BGN')).to be_kind_of(LightCurrencyConverter::CurrencyCourse)
        expect(currency_collection.find_currency_course('BGN', 'USD')).to be_kind_of(LightCurrencyConverter::CurrencyCourse)
      end

      it 'return IndirectCurrencyCourse when direct currency link exists' do
        expect(currency_collection.find_currency_course('USD', 'EUR')).to be_kind_of(LightCurrencyConverter::IndirectCurrencyCourse)
      end
    end

    context 'graph find' do
      it 'should return an IndirectCurrencyCourse object' do
        expect(currency_collection.graph_find('USD', 'EUR')).to be_kind_of(LightCurrencyConverter::IndirectCurrencyCourse)
      end

      it 'should return nil if no correlation in the graph is found' do
        expect(currency_collection.graph_find('USD', 'RUB')).to be_nil
      end
    end
  end
end
