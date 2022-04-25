# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_data'
require_relative 'hexlet_code/form_builder'

module HexletCode
  def self.form_for(record, url: '#')
    f = FormData.new(record, url)
    yield(f)
    FormBuilder.build(f)
  end
end
