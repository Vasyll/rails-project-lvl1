# frozen_string_literal: true

module HexletCode
  class TagBuilder
    @single_tag = %w[br img input]

    def self.build(tag, attributes = {}, &block)
      return single(tag, attributes) if @single_tag.include?(tag)

      pair(tag, attributes, &block)
    end

    def self.single(tag, attributes = {})
      tag = Array["<#{tag}"]
      attributes.each { |key, value| tag << " #{key}=\"#{value}\"" }
      tag << '>'
      tag.join
    end

    def self.pair(tag, attributes = {}, &block)
      single(tag, attributes, &block) + "#{yield.to_s if block_given?}</#{tag}>"
    end
  end
end
