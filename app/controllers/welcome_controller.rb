class WelcomeController < ApplicationController
  access all: [:index], trainer: :all
  def index

  end
end
