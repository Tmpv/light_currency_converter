require 'spec_helper'

describe LightCurrencyConverter::Processor do
  let(:currencies) do
    collection = double('LightCurrencyConverter::CurrencyCollection')
    allow(collection).to receive(:find_currency_course).with('BGN', 'USD') { LightCurrencyConverter::CurrencyCourse.new('1 USD', '1 BGN') }
    allow(collection).to receive(:find_currency_course).with('GBP', 'CZK') { nil }
    collection
  end

  let(:processor) { LightCurrencyConverter::Processor.new('BGN', 'USD', 100, currencies) }
  let(:empty_processor) { LightCurrencyConverter::Processor.new('GBP', 'CZK', 100, currencies) }

  context 'process method' do
    it 'should return and convert amount if any given' do
      expect(processor.process).to eq(100)
    end

    it 'should return only the course if no amount is given' do
      processor.amount = nil
      expect(processor.process).to eq('1.0 USD => 1.0 BGN')
    end

    it 'should return a correlation not found message if no course is found' do
      expect(empty_processor.process).to eq('No course correlation has been found.')
    end
  end
end
