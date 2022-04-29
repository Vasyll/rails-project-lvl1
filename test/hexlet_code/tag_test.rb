# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_tag_generation_simple
    assert { HexletCode::Tag.build('br') == '<br>' }
    assert { HexletCode::Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">' }
    assert { HexletCode::Tag.build('div') == '<div></div>' }
  end

  def test_tag_generation_input
    assert { HexletCode::Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">' }
    assert { HexletCode::Tag.build('input', type: 'text') == '<input type="text">' }
    assert do
      HexletCode::Tag.build('input', type: 'text', class: 'user-input') == '<input type="text" class="user-input">'
    end
  end

  def test_tag_generation_label
    assert { HexletCode::Tag.build('label') { 'Email' } == '<label>Email</label>' }
    assert { HexletCode::Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>' }
  end

  def test_tag_generation_form
    assert do
      HexletCode::Tag.build('form', action: '/users', method: 'post') == '<form action="/users" method="post"></form>'
    end
  end

  def test_tag_generation_textarea
    assert { HexletCode::Tag.build('textarea', name: 'job') { 'hexlet' } == '<textarea name="job">hexlet</textarea>' }
    assert do
      HexletCode::Tag.build('textarea', name: 'job', rows: 20, cols: 40) { 'hexlet' } ==
        '<textarea name="job" rows="20" cols="40">hexlet</textarea>'
    end
  end
end
