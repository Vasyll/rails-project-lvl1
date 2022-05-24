# frozen_string_literal: true

require_relative 'form_elements'

module HexletCode
  class FormBuilder
    def self.build(form_data)
      form_html = ''

      form_data.form_units.each do |form_unit|
        form_element = form_unit[:as]

        class_name = Object.const_get("HexletCode::#{form_element.capitalize}")
        form_html += class_name&.build(form_unit.except(:as))
      end

      HexletCode::Tag.build('form', form_options(form_data)) { form_html }
    end

    def self.form_options(form_data)
      form_options = {}
      form_options[:action] = form_data.options[:url] || '#'
      form_options[:method] = 'post'
      form_options.merge!(form_data.options.except(:url))
    end
  end
end
