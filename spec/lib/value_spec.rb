require 'spec_helper'
require 'adjustment_bureau/value'

describe AdjustmentBureau::Value do
  let(:value) { AdjustmentBureau::Value.new(12, 'px') }

  describe '#adjust' do
    it 'applies the given operator to the value and amount' do
      value.adjust(:+, 12)
      expect(value.to_s).to eq '24px'
    end
  end

  describe '#to_s' do
    it 'returns the value and unit as a string' do
      expect(value.to_s).to eq '12px'
    end
  end
end
