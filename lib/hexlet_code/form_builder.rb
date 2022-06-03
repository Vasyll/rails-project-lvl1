# frozen_string_literal: true

require_relative 'inputs'

module HexletCode
  class FormBuilder
    def self.build(form_data)
      form_html = ''

      form_data.inputs.each do |input|
        form_element = input[:as]

        class_name = Object.const_get("HexletCode::#{form_element.capitalize}")
        form_html += class_name.new(input.except(:as)).build if class_name
      end

      HexletCode::Tag.build('form', form_options(form_data)) { form_html }
    end

    def self.form_options(form_data)
      form_options = {
        action: form_data.options[:url] || '#',
        method: :post
      }

      form_options.merge!(form_data.options.except(:url))
    end
  end
end
