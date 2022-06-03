# frozen_string_literal: true

module HexletCode
  class Submit < HexletCode::Input
    def build_input
      HexletCode::Tag.build('input', { type: 'submit' }.merge(input_data))
    end

    def build_label(_name)
      ''
    end
  end
end
