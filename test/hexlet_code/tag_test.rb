# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_tag_generation_simple
    assert { HexletCode::Tag.build('br') == '<br>' }
    assert { HexletCode::Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">' }
    assert { HexletCode::Tag.build('div') == '<div></div>' }
  end
end
