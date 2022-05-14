# frozen_string_literal: true

module HexletCode
  class Default < HexletCode::FormElement
    def self.build(form_unit_data)
      name = form_unit_data[:form_element_name]
      form_html = build_label(name)

      value = form_unit_data[:form_element_value]

      text_options = { type: 'text', name: name, value: value }
      text_options.merge!(form_unit_data.except(:form_element_name, :form_element_value))

      form_html + HexletCode::Tag.build('input', text_options.compact)
    end
  end
end
