# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :FormData, 'hexlet_code/form_data'
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(record, options = {})
    form_data = FormData.new(record, options)
    yield(form_data)
    FormBuilder.build(form_data)
  end
end
