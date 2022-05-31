# frozen_string_literal: true

module HexletCode
  class Text < HexletCode::FormElement
    def self.build(input_data)
      name = input_data[:name]
      form_html = build_label(name)

      options = {
        name: name
      }

      value = input_data[:value]
      form_html + build_input('textarea', options, input_data) { value.to_s }
    end
  end
end
