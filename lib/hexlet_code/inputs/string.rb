# frozen_string_literal: true

module HexletCode
  class String < HexletCode::Input
    def build_input
      HexletCode::Tag.build('input', { type: 'text' }.merge(input_data))
    end
  end
end
