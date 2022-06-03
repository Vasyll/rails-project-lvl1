# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :input_data

    def initialize(input_data)
      @input_data = input_data
    end

    def build
      name = input_data[:name]
      build_label(name) + build_input
    end

    def build_label(name)
      HexletCode::Tag.build('label', for: name) { name.capitalize.to_s }
    end
  end
end
