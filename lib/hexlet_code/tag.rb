# frozen_string_literal: true

require_relative 'pair_tag'
require_relative 'single_tag'

module HexletCode
  module Tag
    @pair_tag = %w[br img input]

    def self.build(tag, options = {}, &block)
      return HexletCode::PairTag.build(tag, options) if @pair_tag.include?(tag)

      HexletCode::SingleTag.build(tag, options, &block)
    end
  end
end
