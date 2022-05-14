# frozen_string_literal: true

module HexletCode
  class Submit < HexletCode::FormElement
    def self.build(form_unit_data)
      value = form_unit_data[:form_element_value]

      submit_options = { type: 'submit', value: value }
      submit_options.merge!(form_unit_data.except(:form_element_value))

      HexletCode::Tag.build('input', submit_options.compact)
    end
  end
end
