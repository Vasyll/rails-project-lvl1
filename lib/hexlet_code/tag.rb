# frozen_string_literal: true

module HexletCode
  autoload :TagBuilder, 'hexlet_code/tag_builder'

  module Tag
    def self.build(tag, options = {}, &block)
      HexletCode::TagBuilder.build(tag, options, &block)
    end
  end
end
