# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  class FormBuilder
    def self.build(form_data)
      form_html = ''

      form_data.form_units.each do |form_unit|
        form_element = form_unit[:form_element]
        form_unit.delete(:form_element)

        case form_element
        when 'input'  then form_html += build_input(form_unit)
        when 'submit' then form_html += build_submit(form_unit)
        end
      end

      form_options = { action: form_data.action, method: 'post' }
      HexletCode::Tag.build('form', form_options) { form_html }
    end

    def self.build_input(options)
      form_html = ''

      as = options[:as]
      options.delete(:as)

      name = options[:form_element_name]
      options.delete(:form_element_name)
      form_html += HexletCode::Tag.build('label', for: name) { name.capitalize.to_s }

      value = options[:form_element_value]
      options.delete(:form_element_value)

      case as
      when :text
        textarea_options = { name: name }
        form_html += HexletCode::Tag.build('textarea', textarea_options.merge(options).compact) { value.to_s }
      when nil
        text_options = { type: 'text', name: name, value: value }
        form_html += HexletCode::Tag.build('input', text_options.merge(options).compact)
      end
      form_html
    end

    def self.build_submit(options)
      value = options[:form_element_value]
      options.delete(:form_element_value)

      submit_options = { type: 'submit', value: value }
      HexletCode::Tag.build('input', submit_options.merge(options).compact)
    end
  end
end
