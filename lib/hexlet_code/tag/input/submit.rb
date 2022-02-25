# frozen_string_literal: true

module HexletCode
  module Tag
    module Input
      module Submit
        def self.build(options = {})
          tag = Array['<input type="submit"']

          name = options[:name]
          tag << " name=\"#{name}\"" unless name.nil?

          value = options[:value]
          tag << " value=\"#{value}\"" unless value.nil?

          attr_class = options[:class]
          tag << " class=\"#{attr_class}\"" unless attr_class.nil?

          tag << '>'
          tag.join
        end
      end
    end
  end
end
