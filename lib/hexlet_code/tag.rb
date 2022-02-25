# frozen_string_literal: true

require_relative "tag/input"
require_relative "tag/label"
require_relative "tag/textarea"

module HexletCode
  module Tag
    def self.build(tag, options = {}, &block)
      return "<br>" if tag == "br"
      return "<img src=\"#{options[:src]}\">" if tag == "img"
      return HexletCode::Tag::Input.build(options) if tag == "input"
      return HexletCode::Tag::Label.build(options, &block) if tag == "label"
      return HexletCode::Tag::Textarea.build(options, &block) if tag == "textarea"
      return "<div></div>" if tag == "div"
    end
  end
end
