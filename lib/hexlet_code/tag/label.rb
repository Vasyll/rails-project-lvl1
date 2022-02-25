# frozen_string_literal: true

module HexletCode
  module Tag
    module Label
      def self.build(options = {})
        tag = Array["<label"]

        name = options[:for]
        tag << " for=\"#{name}\"" unless name.nil?

        tag << ">#{yield}</label>"
        tag.join
      end
    end
  end
end
