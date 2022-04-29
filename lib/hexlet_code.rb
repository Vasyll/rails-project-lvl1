# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :FormData, 'hexlet_code/form_data.rb'
  autoload :PairTag, 'hexlet_code/pair_tag.rb'
  autoload :SingleTag, 'hexlet_code/single_tag.rb'
  autoload :Tag, 'hexlet_code/tag.rb'

  def self.form_for(record, url: '#')
    form_data = FormData.new(record, url)
    yield(form_data)
    FormBuilder.build(form_data)
  end
end
