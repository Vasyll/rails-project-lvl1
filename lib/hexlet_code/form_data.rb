# frozen_string_literal: true

module HexletCode
  class FormData
    attr_reader :options, :form_units

    def initialize(record, options)
      @record = record
      @options = options
      @form_units = []
    end

    def input(name, options = {})
      form_unit = {}
      form_unit[:as] = 'default'

      form_unit[:form_element_name] = name
      form_unit[:form_element_value] = @record.public_send(name)

      form_unit.merge!(options)

      @form_units << form_unit.compact
    end

    def submit(value = 'Save')
      form_unit = {}
      form_unit[:as] = 'submit'
      form_unit[:form_element_value] = value

      @form_units << form_unit.compact
    end
  end
end
