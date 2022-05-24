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

  def test_form_generation_form
    assert { HexletCode.form_for(@user) { |f| } == load_fixture('form.html') } # TODO
    assert { HexletCode.form_for(@user, url: '/users') { |f| } == load_fixture('form_path.html') } # TODO
  end

  def test_form_generation_form1
    form_input = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert { form_input == load_fixture('form_input.html') }
  end

  def test_form_generation_form2
    form_input_textarea = HexletCode.form_for @user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit 'OK'
    end
    assert { form_input_textarea == load_fixture('form_input_textarea.html') }
  end

  def test_form_generation_form3
    form_input = HexletCode.form_for @user, method: :patch, class: 'my-awesome-form' do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert { form_input == load_fixture('form_input_patch.html') }
  end
end
