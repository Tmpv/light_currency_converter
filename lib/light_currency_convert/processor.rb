module LightCurrencyConverter
  class Processor
    attr_accessor :from, :to, :amount, :currencies, :course

    def initialize(from, to, amount, currecnies)
      @from = from
      @to = to
      @amount = amount
      @currecnies = currecnies
      @course = currecnies.find_currency_course(from, to)
    end

    def process
      amount.nil? ? show_course : convert
    rescue NoCourseFundError
      'No course correlation has been found.'
    end

    def convert
      raise NoCourseFundError unless @course
      @course.convert(amount, from, to)
    end

    def show_course
      raise NoCourseFundError unless @course
      @course.to_s
    end
  end
end

class NoCourseFundError < Exception; end
