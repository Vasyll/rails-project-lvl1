# frozen_string_literal: true

require_relative "tag"

class Form
  def initialize(user, action)
    @user = user
    @form_html = "<form action=\"#{action}\" method=\"post\">"
  end

  def input(name, options = {})
    value = @user.public_send(name)
    as = options[:as]

    @form_html += HexletCode::Tag.build("label", for: name) { name.capitalize.to_s }

    case as
    when :text
      @form_html += HexletCode::Tag.build("textarea", name: name) { value.to_s }
    when nil
      @form_html += HexletCode::Tag.build("input", name: name, type: "text", value: value)
    end
  end

  def submit(value = "Save")
    @form_html += HexletCode::Tag.build("input", name: "commit", type: "submit", value: value)
  end

  def get_form
    "#{@form_html}</form>"
  end
end
