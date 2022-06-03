# frozen_string_literal: true

module HexletCode
  class String < HexletCode::Input
    def self.build_input(input_data)
      HexletCode::Tag.build('input', { type: 'text' }.merge(input_data))
    end
  end
end
