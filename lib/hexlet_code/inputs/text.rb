# frozen_string_literal: true

module HexletCode
  class Text < HexletCode::Input
    def self.build_input(input_data)
      value = input_data[:value]
      HexletCode::Tag.build('textarea', input_data.except(:value)) { value.to_s }
    end
  end
end
