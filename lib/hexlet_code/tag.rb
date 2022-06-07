# frozen_string_literal: true

module HexletCode
  module Tag
    @single_tag = %w[br img input]

    def self.build(tag, attributes = {}, &block)
      return single(tag, attributes) if @single_tag.include?(tag)

      pair(tag, attributes, &block)
    end

    def self.single(tag, attributes = {})
      tag_attributes = []
      attributes.each { |key, value| tag_attributes << " #{key}=\"#{value}\"" }
      "<#{tag}#{tag_attributes.join}>"
    end

    def self.pair(tag, attributes = {}, &block)
      single(tag, attributes, &block) + "#{yield.to_s if block_given?}</#{tag}>"
    end
  end
end
