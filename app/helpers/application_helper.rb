# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def greeting(user)
    name = user.full_name.presence || user.phone

    "Hello, #{name}! You are #{user.type}"
  end
end
