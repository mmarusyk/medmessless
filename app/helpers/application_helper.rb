# frozen_string_literal: true

module ApplicationHelper
  def greeting(user)
    name = user.full_name.presence || user.phone

    "Hello, #{name}!"
  end
end
