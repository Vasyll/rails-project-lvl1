# frozen_string_literal: true

require_relative 'input/text'
require_relative 'input/submit'

module HexletCode
  module Tag
    module Input
      def self.build(options = {})
        type = options[:type]
        case type
        when 'text' then HexletCode::Tag::Input::Text.build(options)
        when 'submit' then HexletCode::Tag::Input::Submit.build(options)
        when nil then puts "The <type> attribute was not specified for the <input> tag options: #{options}"
        else puts "Unknown <type> attribute \"#{type}\" for <input> tag"
        end
      end
    end
  end
end
