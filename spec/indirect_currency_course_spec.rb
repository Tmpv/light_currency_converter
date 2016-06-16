require 'spec_helper'

describe LightCurrencyConverter::IndirectCurrencyCourse do
  let(:usd_to_bng_course) { LightCurrencyConverter::CurrencyCourse.new('1 USD', '1.74 BGN') }
  let(:eur_to_bgn_course) { LightCurrencyConverter::CurrencyCourse.new('1 EUR', '1.96 BGN') }
  let(:currency_path) { [['USD', 'BGN'], ['BGN', 'EUR']] }

  it 'should calculate USD to EUR' do
    indirect_course = LightCurrencyConverter::IndirectCurrencyCourse.new([usd_to_bng_course, eur_to_bgn_course], currency_path)

    expect(indirect_course.convert(1)).to eq(0.89)
    expect(indirect_course.to_s).to include('EUR')
    expect(indirect_course.to_s).to include('USD')
  end
end
