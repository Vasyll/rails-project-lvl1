# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_generation
    assert_equal('<br>', HexletCode::Tag.build('br'))
    assert_equal('<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image'))
    assert_equal('<div></div>', HexletCode::Tag.build('div'))
    assert_equal('<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save'))
    assert_equal('<input type="text">', HexletCode::Tag.build('input', type: 'text'))
    assert_equal('<input type="text" class="user-input">',
                 HexletCode::Tag.build('input', type: 'text', class: 'user-input'))
    assert_equal('<label>Email</label>', HexletCode::Tag.build('label') { 'Email' })
    assert_equal('<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' })
    assert_equal('<textarea name="job">hexlet</textarea>', HexletCode::Tag.build('textarea', name: 'job') { 'hexlet' })
    assert_equal('<textarea name="job" rows="20" cols="40">hexlet</textarea>', HexletCode::Tag.build('textarea', name: 'job', rows: 20, cols: 40) do
                                                                                 'hexlet'
                                                                               end)
  end

  def test_form_generation
    user = User.new name: 'rob', job: 'hexlet'

    assert_equal(File.read('test/fixtures/form.html'), HexletCode.form_for(user) { |f| })
    assert_equal(File.read('test/fixtures/form_path.html'), HexletCode.form_for(user, url: '/users') { |f| })

    form_input = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert_equal(File.read('test/fixtures/form_input.html'), form_input)

    form_input_textarea = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit 'OK'
    end
    assert_equal(File.read('test/fixtures/form_input_textarea.html'), form_input_textarea)
  end
end
