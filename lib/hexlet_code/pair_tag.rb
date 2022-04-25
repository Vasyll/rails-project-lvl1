# frozen_string_literal: true

module HexletCode
  class PairTag
    def self.build(tag, attributes = {})
      html = []
      html << tag_html(tag)
      html << attributes_html(attributes)
      html << '>'
      html.join
    end

    def self.tag_html(tag)
      Array["<#{tag}"]
    end

    def self.attributes_html(attributes)
      html = []
      return html if attributes.nil?

      attributes.map { |key, value| html << " #{key}=\"#{value}\"" }
      html
    end
  end
end
