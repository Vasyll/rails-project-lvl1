# frozen_string_literal: true

module HexletCode
  class PairTag < HexletCode::SingleTag
    def self.build(tag, attributes = {}, &block)
      super(tag, attributes, &block) + "#{yield.to_s if block_given?}</#{tag}>"
    end
  end
end
