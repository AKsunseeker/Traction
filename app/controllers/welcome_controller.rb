class WelcomeController < ApplicationController
  access all: [:index], trainer: :all
  def index
  end

  def about_ush
  end
end
