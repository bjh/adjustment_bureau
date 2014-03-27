require_relative 'parser'

module AdjustmentBureau
  class Adjuster
    attr_accessor :properties, :type, :amount

    def initialize(adjustable_properties_list, type, amount)
      @properties = adjustable_properties_list.map &:to_s
      @type = type
      @amount = amount
    end

    def adjust(property_string)
      property = Property.parse(property_string)
      property.adjust(type, amount) if adjustable? property
      property
    end

  private

    def adjustable?(property)
      @properties.include? property.name
    end
  end
end
