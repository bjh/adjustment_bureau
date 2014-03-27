require 'spec_helper'
require 'adjustment_bureau/property'

describe AdjustmentBureau::Property do
  let(:property) { AdjustmentBureau::Property.parse('font-size: 10pt;') }

  describe '.parse' do
    it 'parses the property string and sets the fields' do
      expect(property.to_s).to eq 'font-size: 10pt;'
    end
  end

  describe '#adjust' do
    it 'adjusts multiple values' do
      property = AdjustmentBureau::Property.parse('margin: 1px 2px 3px 4px;')
      property.adjust(:+, 10)
      expect(property.to_s).to eq 'margin: 11px 12px 13px 14px;'
    end

    it 'adjusts a single value' do
      property.adjust(:*, 10)
      expect(property.to_s).to eq 'font-size: 100pt;'
    end
  end

  describe '#to_s' do
    it 'returns a valid CSS property string' do
      expect(property.to_s).to eq 'font-size: 10pt;'
    end

    it 'returns a valid CSS property string with multiple values' do
      property = AdjustmentBureau::Property.parse('margin: 1px 2px 3px 4px;')
      expect(property.to_s).to eq 'margin: 1px 2px 3px 4px;'
    end

    it 'can pad the beggining of the property string' do
      expect(property.to_s(4)).to eq '    font-size: 10pt;'
    end
  end
end
