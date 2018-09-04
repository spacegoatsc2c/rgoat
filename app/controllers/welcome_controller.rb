class WelcomeController < ApplicationController
  def index
    @characters = Character.all
    @bosses = Boss.pluck(:name, :zone)
  end
end
