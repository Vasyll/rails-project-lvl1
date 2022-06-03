# frozen_string_literal: true

module HexletCode
  class Input
    def self.build(input_data)
      name = input_data[:name]
      build_label(name) + build_input(input_data)
    end

    def self.build_label(name)
      HexletCode::Tag.build('label', for: name) { name.capitalize.to_s }
    end
  end
end
