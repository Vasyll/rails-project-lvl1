# frozen_string_literal: true

module HexletCode
  class FormData
    attr_reader :options, :inputs

    def initialize(record, options)
      @record = record
      @options = options
      @inputs = []
    end

    def input(name, options = {})
      input = {
        as: :string,
        name: name,
        value: @record.public_send(name)
      }
      input.merge!(options)

      @inputs << input.compact
    end

    def submit(value = 'Save')
      input = {
        as: :submit,
        value: value
      }

      @inputs << input
    end
  end
end
