# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert_match("<br>", HexletCode::Tag.build("br"))
    assert_match('<img src="path/to/image">', HexletCode::Tag.build("img", src: "path/to/image"))
    assert_match('<input type="submit" value="Save">', HexletCode::Tag.build("input", type: "submit", value: "Save"))
    assert_match("<label>Email</label>", HexletCode::Tag.build("label") { "Email" })
    assert_match('<label for="email">Email</label>', HexletCode::Tag.build("label", for: "email") { "Email" })
    assert_match("<div></div>", HexletCode::Tag.build("div"))
  end
end
