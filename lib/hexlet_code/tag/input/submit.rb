# frozen_string_literal: true

module HexletCode
  module Tag
    module Input
      module Submit
        def self.build(options = {})
          value = options[:value]
          return " value=\"#{value}\"" unless value.nil?
        end
      end
    end
  end
end
