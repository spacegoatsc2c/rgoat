class WelcomeController < ApplicationController
  def index
    @character = Character.find(session[:current_character_id]) unless session[:current_character_id] == nil
    max_level = Character.maximum(:level)
    @characters = Character.where(level: max_level).order(ilvl: :desc)
    @youtubes = Youtube.all.order(created_at: :desc)
    @patch = Boss.where.not(patch: nil).order(patch: :desc).first.patch
    @bosses = Boss.where(patch: @patch)
  end
end
