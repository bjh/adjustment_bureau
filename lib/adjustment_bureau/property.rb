require_relative 'parser'

module AdjustmentBureau
  Property = Struct.new(:name, :values) do
    def self.parse(property_string)
      Property.new(*Parser.new.parse(property_string))
    end

    def adjust(type, amount)
      values.each do |value|
        value.adjust(type, amount)
      end
    end

    def to_s(padding=0)
      output = []
      output << (' ' * padding)
      output << "#{name}: "
      output << values.map(&:to_s).join(' ')
      output << ';'
      output.join('')
    end
  end
end
