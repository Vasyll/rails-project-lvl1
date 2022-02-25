# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_generation_simple
    assert_equal('<br>', HexletCode::Tag.build('br'))
    assert_equal('<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image'))
    assert_equal('<div></div>', HexletCode::Tag.build('div'))
  end

  def test_tag_generation_input
    assert_equal('<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save'))
    assert_equal('<input type="text">', HexletCode::Tag.build('input', type: 'text'))
    assert_equal('<input type="text" class="user-input">',
                 HexletCode::Tag.build('input', type: 'text', class: 'user-input'))
  end

  def test_tag_generation_label
    assert_equal('<label>Email</label>', HexletCode::Tag.build('label') { 'Email' })
    assert_equal('<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' })
  end

  def test_tag_generation_textarea
    assert_equal('<textarea name="job">hexlet</textarea>', HexletCode::Tag.build('textarea', name: 'job') { 'hexlet' })
    assert_equal('<textarea name="job" rows="20" cols="40">hexlet</textarea>',
                 HexletCode::Tag.build('textarea', name: 'job', rows: 20, cols: 40) { 'hexlet' })
  end

  def test_form_generation_form
    assert_equal(File.read('test/fixtures/form.html'), HexletCode.form_for(@user) { |f| }) # TODO
    assert_equal(File.read('test/fixtures/form_path.html'), HexletCode.form_for(@user, url: '/users') { |f| }) # TODO
  end

  def test_form_generation_form1
    form_input = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert_equal(File.read('test/fixtures/form_input.html'), form_input)
  end

  def test_form_generation_form2
    form_input_textarea = HexletCode.form_for @user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit 'OK'
    end
    assert_equal(File.read('test/fixtures/form_input_textarea.html'), form_input_textarea)
  end
end
