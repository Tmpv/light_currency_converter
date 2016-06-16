module LightCurrencyConverter
  class CurrencyCourse
    attr_accessor :from, :to

    def initialize(from, to)
      @from = CurrencyEntry.new(*from.split)
      @to = CurrencyEntry.new(*to.split)
    end

    def convert(amount, from, to)
      if from == self.from.currency && to == self.to.currency
        normal_convert(amount)
      elsif to == self.from.currency && from == self.to.currency
        invers_convert(amount)
      else
        raise ArgumentError, 'No match for the currencies'
      end
    end

    def normal_convert(amount)
      ((amount.to_f / from.value.to_f) * to.value.to_f).round(2)
    end

    def invers_convert(amount)
      ((amount.to_f / to.value.to_f) * from.value.to_f).round(2)
    end

    def to_s
      "#{from.value} #{from.currency} => #{to.value} #{to.currency}"
    end
  end
end
