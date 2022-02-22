# frozen_string_literal: true

require_relative "input/text"
require_relative "input/submit"

module HexletCode
  module Tag
    module Input
      def self.build(options = {})
        type = options[:type]
        name = options[:name]
        tag = Array["<input"]
        tag << " name=\"#{name}\"" unless name.nil?

        case type
        when "text" then tag << ' type="text"' << HexletCode::Tag::Input::Text.build(options)
        when "submit" then tag << ' type="submit"' << HexletCode::Tag::Input::Submit.build(options)
        when "number" then tag << ' type="number"'
        when nil then puts "The <type> attribute was not specified for the <input> tag options: #{options}"
        else puts "Unknown <type> attribute \"#{type}\" for <input> tag"
        end

        tag << ">"
        tag.join
      end
    end
  end
end
