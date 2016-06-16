require 'spec_helper'
describe LightCurrencyConverter::Graph do
  let(:graph) do
    LightCurrencyConverter::Graph.new do |graph|
      graph.add_edge('a', 'b')
      graph.add_edge('b', 'c')
      graph.add_edge('b', 'd')
      graph.add_edge('c', 'd')
      graph.add_edge('m', 'e')
    end
  end

  it 'should return the right path to a node' do
    graph.search_path('a', 'd', [], results = [])
    min_result = graph.minimize_result(results)
    expect(min_result).to eq(%w(a b d))
  end

  it 'should return an empty array if there is no path to the element' do
    graph.search_path('a', 'm', results = [], [])
    expect(results).to be_empty
  end
end
