require_relative 'value'

module AdjustmentBureau
  class Parser
    def parse(property_string)
      name = parse_name(property_string)
      values = parse_values(property_string)
      puts "NAME: #{name}, VALUES: #{values}"
      return [name, values]
    end

  private
    def numeric?(value)
      /^[0-9]/.match(value.to_s)
    end

    def parse_name(property_string)
      property_string.split(':')[0].strip
    end

    def parse_values(property_string)
      values = property_string.split(':')[1].strip.gsub(/\;/, '')

      values.split(' ').collect do |value|
        Value.new(*parse_value(value))
      end
    end

    def parse_value(value)
      n = (value = value.to_s.strip)

      # usually auto or inherit when not a number
      if numeric? n
        # NOTE: .to_i handles negative numbers...
        n = n.to_i
      end

      return [
        n,
        /[^0-9]*$/.match(value)[0]
      ]
    end
  end
end
