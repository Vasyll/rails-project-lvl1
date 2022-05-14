# frozen_string_literal: true

module HexletCode
  class Text < HexletCode::FormElement
    def self.build(form_unit_data)
      name = form_unit_data[:form_element_name]
      form_html = build_label(name)

      value = form_unit_data[:form_element_value]

      textarea_options = { name: name }
      textarea_options.merge!(form_unit_data.except(:form_element_name, :form_element_value))

      form_html + HexletCode::Tag.build('textarea', textarea_options.compact) { value.to_s }
    end
  end
end
