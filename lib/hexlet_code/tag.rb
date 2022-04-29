# frozen_string_literal: true

module HexletCode
  module Tag
    @single_tag = %w[br img input]

    def self.build(tag, options = {}, &block)
      return HexletCode::SingleTag.build(tag, options) if @single_tag.include?(tag)

      HexletCode::PairTag.build(tag, options, &block)
    end
  end
end
