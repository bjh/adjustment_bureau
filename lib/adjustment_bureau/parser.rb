require_relative 'value'
require_relative 'helpers'

module AdjustmentBureau
  class Parser

    def parse(property_string)
      name = parse_name(property_string)
      values = parse_values(property_string)
      return [name, values]
    end

  private

    def parse_name(property_string)
      property_string.split(':')[0].strip
    end

    def parse_values(property_string)
      values = property_string.split(':')[1].strip.gsub(/\;/, '')

      values.split(/\s+/m).collect do |value|
        Value.new(*parse_value(value))
      end
    end

    def parse_value(value)
      n = (value = value.to_s.strip)
      value = n.gsub(/[^0-9\.]/, '')
      unit =  /[^0-9\.]*$/.match(n)[0]

      return [
        Helpers.numerize(value),
        unit
      ]
    end
  end
end
