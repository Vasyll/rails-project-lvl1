# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  module Tag
    def self.build(tag, options = {})
      return "<br>" if tag == "br"
      return "<img src=\"#{options[:src]}\">" if tag == "img"
      return "<input type=\"#{options[:type]}\" value=\"#{options[:value]}\">" if tag == "input"
      return "<label>#{yield}</label>" if tag == "label" && options[:for].nil?
      return "<label for=\"#{options[:for]}\">#{yield}</label>" if tag == "label"
      return "<div></div>" if tag == "div"
    end
  end
end
