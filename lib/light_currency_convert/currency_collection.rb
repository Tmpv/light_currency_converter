require 'json'
module LightCurrencyConverter
  class CurrencyCollection
    include Enumerable

    attr_accessor :currencies, :graph

    def initialize(json_string)
      json_entries = JSON.parse(json_string)
      @currencies = json_entries.to_a.map { |e| CurrencyCourse.new(*e) }
      @graph = Graph.new
      populate_graph
    end

    def each
      @currencies.each { |e| yield(e) }
    end

    def [](*args)
      @currencies[*args]
    end

    def find_currency_course(from, to)
      simple_find(from, to) || graph_find(from, to)
    end

    def base_find(currency_one, currency_two)
      detect { |e| e.from.currency == currency_one && e.to.currency == currency_two }
    end

    def simple_find(from, to)
      base_find(from, to) || base_find(to, from)
    end

    def graph_find(from, to)
      graph.search_path(from, to, [], results = [])
      return nil if results.empty?

      result = graph.minimize_result(results)
      full_path = [result[0], *(result[1..-2].map{|x| [x, x] }.flatten), result[-1]].each_slice(2)
      courses = full_path.map { |x| simple_find(*x) }
      IndirectCurrencyCourse.new(courses, full_path)
    end

    private

    def populate_graph
      each do |currency_entry|
        @graph.add_edge(currency_entry.from.currency, currency_entry.to.currency)
      end
    end
  end
end
