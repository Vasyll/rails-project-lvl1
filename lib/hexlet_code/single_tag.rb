# frozen_string_literal: true

require_relative 'pair_tag'

module HexletCode
  class SingleTag < HexletCode::PairTag
    def self.build(tag, attributes = {}, &block)
      html = []
      html << yield.to_s if block_given?
      html << tag_end_html(tag)
      super(tag, attributes, &block) + html.join
    end

    def self.tag_end_html(tag)
      Array["</#{tag}>"]
    end
  end
end
