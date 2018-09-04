require 'bnet'

class SessionsController < ApplicationController
  def create
    token = request.env['omniauth.auth']['credentials']['token']
    token = ENV['BNET_TOKEN'] unless Rails.env.production?
    session[:current_character_id] = 1 unless Rails.env.production?
    return redirect_to '/' unless Rails.env.production?
    session[:bnet_token] = token
    @characters = Array.new
    bnet = Battlenet.new(locale: "en_us", api_key: ENV['BNET_API'])
    users_characters = bnet.characters(access_token: token)
    users_characters['characters'].each do | character |
      if character.fetch('guild', nil) == 'Space Goats CoastToCoast' &&
         character.fetch('realm') == 'Whisperwind'
        c = Character.find_or_create_by(name: character['name'],
                                        realm: character['realm'])
        c.update(portrait: bnet.character_image(character: character),
                 level: character['level'])
        @characters.push(c)
      end
    end
  end

  def pick
    @character = Character.find(params[:character_id])
    session[:current_character_id] = @character.id
    redirect_to '/'
  end

  def logout
    session[:current_character_id] = nil
    session[:bnet_token] = nil
    redirect_to '/'
  end
end
