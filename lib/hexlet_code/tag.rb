# frozen_string_literal: true

module HexletCode
  autoload :PairTag, 'hexlet_code/pair_tag'
  autoload :SingleTag, 'hexlet_code/single_tag'

  module Tag
    @single_tag = %w[br img input]

    def self.build(tag, options = {}, &block)
      return HexletCode::SingleTag.build(tag, options) if @single_tag.include?(tag)

      HexletCode::PairTag.build(tag, options, &block)
    end
  end
end
