# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to "#{current_user.type.downcase}_profile".to_sym
  end
end
