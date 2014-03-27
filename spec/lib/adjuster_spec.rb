require 'spec_helper'
require 'adjustment_bureau/adjuster'

describe AdjustmentBureau::Adjuster do
  let(:adjuster) {
    AdjustmentBureau::Adjuster.new([:top, :left], :+, 10)
  }

  describe '#adjust' do
    context 'when a property is adjustable' do
      it 'returns a Property with adjusted values' do
        property = adjuster.adjust('top: 100px;')
        expect(property.to_s).to eq 'top: 110px;'
      end

      it 'handles floating point values' do
        property = adjuster.adjust('top: 10.12px;')
        expect(property.to_s).to eq 'top: 20.12px;'
      end
    end

    context 'when a property is NOT adjustable' do
      it 'returns a Property with un-adjusted values' do
        property = adjuster.adjust('height: 100px;')
        expect(property.to_s).to eq 'height: 100px;'
      end
    end
  end
end
