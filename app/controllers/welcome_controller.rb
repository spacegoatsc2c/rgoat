class WelcomeController < ApplicationController
  def index
    @character = Character.find(session[:current_character_id]) unless session[:current_character_id] == nil
    @characters = Character.where(level: 120).order(ilvl: :desc)
    @youtubes = Youtube.all
    @patch = Boss.where.not(patch: nil).order(patch: :desc).first.patch
    @bosses = Boss.where(patch: @patch)
  end
end
