# frozen_string_literal: true

module HexletCode
  module Tag
    module Textarea
      def self.build(options = {})
        tag = Array['<textarea cols="20" rows="40"']
        name = options[:name]
        tag << " name=\"#{name}\""
        tag << ">#{yield}</textarea>"
        tag.join
      end
    end
  end
end
