require_relative 'parser'

module AdjustmentBureau
  class Adjuster
    attr_accessor :properties, :type, :amount

    def initialize(adjustable_properties, type, amount)
      # TODO: make sure all keys are strings instead of symbols
      @properties = adjustable_properties
      @type = type
      @amount = amount
    end

    def adjust(property_string)
      property = Property.parse(property_string)
      property.adjust(type, amount) if adjustable? property
    end

  private

    def adjustable?(property)
      @properties.has_key? property.to_s
    end
  end
end
