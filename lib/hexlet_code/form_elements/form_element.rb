# frozen_string_literal: true

module HexletCode
  class FormElement
    def self.build_label(name)
      HexletCode::Tag.build('label', for: name) { name.capitalize.to_s }
    end
  end
end
