# frozen_string_literal: true

module HexletCode
  class Text < HexletCode::Input
    def build_input
      value = input_data[:value]
      HexletCode::Tag.build('textarea', input_data.except(:value)) { value.to_s }
    end
  end
end
