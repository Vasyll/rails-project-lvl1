# frozen_string_literal: true

module HexletCode
  class SingleTag
    def self.build(tag, attributes = {})
      "<#{tag}#{attributes_html(attributes)}>"
    end

    def self.attributes_html(attributes)
      html = ''
      attributes.map { |key, value| html += " #{key}=\"#{value}\"" }
      html
    end
  end
end
