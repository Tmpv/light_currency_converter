module LightCurrencyConverter
  class CurrencyEntry
    attr_accessor :value, :currency

    def initialize(value, currency)
      @value = value.to_f
      @currency = currency
    end
  end
end
