# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form'

module HexletCode
  class Error < StandardError; end

  def self.form_for(user, url: '#')
    f = Form.new(user, url)
    yield(f)
    f.get_form
  end
end
