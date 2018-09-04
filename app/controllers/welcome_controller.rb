class WelcomeController < ApplicationController
  def index
    @character = Character.find(session[:current_character_id]) unless session[:current_character_id] == nil
    @characters = Character.where(level: 120).order(ilvl: :desc)
    @bosses = Boss.pluck(:name, :zone)
  end
end
