require 'spec_helper'
require 'adjustment_bureau/helpers'

describe AdjustmentBureau::Helpers do
  # let(:helpers) { Object.new.extend(AdjustmentBureau::Helpers) }
  let(:helpers) { AdjustmentBureau::Helpers }

  describe '#numeric?' do
    it 'returns true for an integer' do
      expect(helpers.numeric?(1)).to be_true
    end

    it 'returns true for a decimal' do
      expect(helpers.numeric?(1.3)).to be_true
    end

    it 'returns true for a decimal with a leading zero' do
      expect(helpers.numeric?(0.3)).to be_true
    end

    it 'returns true for a nmumeric string' do
      expect(helpers.numeric?('0.3')).to be_true
    end

    it 'returns false for anything not a number' do
      expect(helpers.numeric?('shazam')).to be_false
    end
  end

  describe '#numerize' do
    context 'when given an Integer' do
      it 'returns an Integer' do
        expect(helpers.numerize(1)).to eq 1
      end
    end

    context 'when given an numeric String' do
      it 'returns an Integer' do
        expect(helpers.numerize('1.12')).to eq 1.12
      end
    end

    context 'when given a decimal with no fractional part' do
      it 'returns an Integer' do
        expect(helpers.numerize('1.00')).to eq 1
      end
    end

    context 'when given a decimal with a fractional part' do
      it 'returns a Float' do
        expect(helpers.numerize('1.23')).to eq 1.23
      end
    end

    context 'value with manu decimal places' do
      it 'rounds to decimal places' do
        expect(helpers.numerize('1.23456789')).to eq 1.23
      end
    end
  end
end
