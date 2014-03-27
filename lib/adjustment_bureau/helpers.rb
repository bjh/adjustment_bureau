
module AdjustmentBureau
  module Helpers
    def self.numeric?(value)
      Float(value) != nil rescue false
    end

    def self.numerize(value)
      if Helpers.numeric? value
        value = Float(value)
        value = (value == value.floor) ? value.to_i : value.round(2)
      end

      value
    end
  end
end
