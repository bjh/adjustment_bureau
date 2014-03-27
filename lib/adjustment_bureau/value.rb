module AdjustmentBureau
  Value = Struct.new(:value, :unit) do

    def adjust(type, amount)
      # TODO: filter type with value.respond_to?
      self.value = value.method(type).call(amount)
    end

    def to_s
      "#{value}#{unit}"
    end
  end
end
