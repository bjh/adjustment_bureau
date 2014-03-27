require 'spec_helper'
require 'adjustment_bureau/parser'

describe AdjustmentBureau::Parser do
  let(:parser) { AdjustmentBureau::Parser.new }

  describe '.parse' do
    it 'converts the parsed value into an Array' do
      name, values = parser.parse('font-size: 10pt;')
      expect(values).to be_a Array
    end

    it 'handles multiple values' do
      name, values = parser.parse('margin: 1px 2px 3px 4px;')
      expect(values).to be_a Array
    end

    it 'returns the name, value and unit in an array' do
      name, values = parser.parse('font-size: 10pt;')
      expect(name).to eq 'font-size'
      expect(values.first.value).to eq 10
      # expect(unit).to eq 'pt'
    end

    it 'handles floatin point numbers for values' do
      name, values = parser.parse('font-size: 10.4pt;')
      expect(values.first.value).to eq 10.4
    end
  end
end
