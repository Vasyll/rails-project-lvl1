# frozen_string_literal: true

module HexletCode
  class Submit < HexletCode::Input
    def self.build_input(input_data)
      HexletCode::Tag.build('input', { type: 'submit' }.merge(input_data))
    end

    def self.build_label(_name)
      ''
    end
  end
end
