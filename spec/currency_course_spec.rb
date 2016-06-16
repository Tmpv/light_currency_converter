require 'spec_helper'

describe LightCurrencyConverter::CurrencyCourse do
  let(:course) { LightCurrencyConverter::CurrencyCourse.new('1 USD', '1.74 BGN') }

  context 'convert methods' do
    context 'normal convert should convert from USD to BGN' do
      it { expect(course.normal_convert(1)).to eq(1.74) }
      it { expect(course.normal_convert(5)).to eq(8.70) }
      it { expect(course.normal_convert(500)).to eq(870) }
    end

    context 'inverse convert should convert from BGN to USD' do
      it { expect(course.invers_convert(1).round(2)).to eq(0.57) }
      it { expect(course.invers_convert(5).round(2)).to eq(2.87) }
      it { expect(course.invers_convert(500).round(2)).to eq(287.36) }
    end

    context 'convert method should convert from bout currencies' do
      it { expect(course.convert(1, 'USD', 'BGN')).to eq(1.74) }
      it { expect(course.convert(1, 'BGN', 'USD').round(2)).to eq(0.57) }

      it 'should raise and exception if invalid course symbols are given' do
        expect { course.convert('BGN', 'USD', 1) }.to raise_error(ArgumentError)
      end
    end
  end
end
