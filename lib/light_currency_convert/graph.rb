module LightCurrencyConverter
  class Graph
    attr_accessor :graph

    def initialize(&block)
      @graph = Hash.new { |hash, key| hash[key] = [] }
      yield self if block_given?
    end

    def add_edge(a, b)
      @graph[a] << b
      @graph[b] << a
    end

    def minimize_result(results)
      results.reduce(Array.new(1000)) do |end_array, element|
        (element.size < end_array.size) ? element : end_array
      end
    end

    def search_path(a, b, result, lr)
      result += [a]
      lr << result if a == b
      @graph[a].each do |v|
        search_path(v, b, result, lr) unless result.include?(v)
      end
    end
  end
end
