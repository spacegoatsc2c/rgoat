require 'bnet'

class SessionsController < ApplicationController
  def create
    token = request.env['omniauth.auth']['credentials']['token']
    @characters = Array.new
    bnet = Battlenet.new(locale: "en_us", api_key: ENV['BNET_API'])
    users_characters = bnet.characters(access_token: token)
    users_characters['characters'].each do | character |
      if character.fetch('guild', nil) == 'Space Goats CoastToCoast' &&
         character.fetch('realm') == 'Whisperwind'
        c = Character.find_or_create_by(name: character['name'],
                                        portrait: bnet.character_image(character: character),
                                        realm: character['realm'])
        @characters.push(c)
      end
    end
  end
end
