# frozen_string_literal: true

module HexletCode
  module Tag
    module Textarea
      def self.build(options = {})
        tag = Array['<textarea']

        name = options[:name]
        tag << " name=\"#{name}\"" unless name.nil?

        rows = options[:rows]
        tag << " rows=\"#{rows}\"" unless rows.nil?

        cols = options[:cols]
        tag << " cols=\"#{cols}\"" unless cols.nil?

        tag << ">#{yield}</textarea>"
        tag.join
      end
    end
  end
end
