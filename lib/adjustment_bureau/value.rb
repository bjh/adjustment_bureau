require_relative 'helpers'

module AdjustmentBureau
  Value = Struct.new(:value, :unit) do

    def adjust(type, amount)
      if not value.respond_to?(type)
        raise ArgumentError.new("the value: #{value} cannot have function #{type} applied to it.")
      end

      self.value = Helpers.numerize(value.method(type).call(amount))
    end

    def to_s
      "#{value}#{unit}"
    end
  end
end
