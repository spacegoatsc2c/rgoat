class WelcomeController < ApplicationController
  def index
    @characters = Character.all
    @bosses = Boss.all
  end
end
