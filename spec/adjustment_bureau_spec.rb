require 'spec_helper'
require 'adjustment_bureau.rb'

describe AdjustmentBureau do
  describe '.' do
    context 'when ...' do
      it 'does stuff' do
        properties = [
          'top: 100px;',
          'left: 100px;',
          'width: 100px;',
          'height: 100px;'
        ]

        adjustable_properties = [:top, :left]
        adjustment_operation = :+
        adjustment_amount = 10

        adjuster = AdjustmentBureau::Adjuster.new(
          adjustable_properties,
          adjustment_operation,
          adjustment_amount)

        properties.map! { |p| adjuster.adjust(p).to_s }

        # expected output
        expected = [
          'top: 110px;',
          'left: 110px;',
          'width: 100px;',
          'height: 100px;'
        ]

        expect(properties).to eq expected
      end
    end
  end
end
