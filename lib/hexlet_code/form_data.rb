# frozen_string_literal: true

module HexletCode
  class FormData
    attr_reader :action, :form_units

    def initialize(record, action)
      @record = record
      @action = action
      @form_units = []
    end

    def input(name, options = {})
      form_unit = {}
      form_unit[:form_element] = 'input'

      form_unit[:form_element_name] = name
      form_unit[:form_element_value] = @record.public_send(name)

      form_unit.merge!(options)

      @form_units << form_unit.compact
    end

    def submit(value = 'Save')
      form_unit = {}
      form_unit[:form_element] = 'submit'
      form_unit[:form_element_value] = value

      @form_units << form_unit
    end
  end
end
