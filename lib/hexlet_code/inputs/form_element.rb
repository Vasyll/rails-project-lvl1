# frozen_string_literal: true

module HexletCode
  class FormElement
    def self.build_label(name)
      HexletCode::Tag.build('label', for: name) { name.capitalize.to_s }
    end

    def self.build_input(tag, options, input_data, &block)
      HexletCode::Tag.build(tag, options.merge(input_data.except(:name, :value)).compact, &block)
    end
  end
end
