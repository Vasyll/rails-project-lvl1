# frozen_string_literal: true

module HexletCode
  class String < HexletCode::FormElement
    def self.build(input_data)
      name = input_data[:name]
      form_html = build_label(name)

      options = {
        type: 'text',
        name: name,
        value: input_data[:value]
      }

      form_html + build_input('input', options, input_data)
    end
  end
end
