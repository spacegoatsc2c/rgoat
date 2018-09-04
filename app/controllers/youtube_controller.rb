class YoutubeController < ApplicationController
  def new
    @character = Character.find(session[:current_character_id]) unless session[:current_character_id] == nil
  end

  def create
    Youtube.create(youtube_params)
    redirect_to '/'
  end

  private
    def youtube_params
      params.require(:youtube).permit(:link, :character_id, :boss_id)
    end
end
