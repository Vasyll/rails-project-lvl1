# frozen_string_literal: true

module HexletCode
  class Submit < HexletCode::FormElement
    def self.build(input_data)
      options = {
        type: 'submit',
        value: input_data[:value]
      }

      build_input('input', options, input_data)
    end
  end
end
