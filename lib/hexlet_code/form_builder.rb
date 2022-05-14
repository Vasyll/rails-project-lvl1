# frozen_string_literal: true

require_relative 'form_elements'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'

  class FormBuilder
    def self.build(form_data)
      form_html = ''

      form_data.form_units.each do |form_unit|
        form_element = form_unit[:as]

        form_html += Object.const_get("HexletCode::#{form_element.capitalize}")&.build(form_unit.except(:as))
      end

      action = form_data.options[:url] || '#'
      form_options = { action: action, method: 'post' }
      HexletCode::Tag.build('form', form_options) { form_html }
    end
  end
end
