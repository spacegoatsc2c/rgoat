require 'bnet'

class SessionsController < ApplicationController
  def create
    puts request.env['omniauth.auth']['credentials']['token']
    render plain: request.env['omniauth.auth'].inspect
    # bnet = Battlenet.new(locale: "en_us", api_key: ENV['BNET_API'])
    # guild = bnet.guild(realm: "Whisperwind", name: "Space Goats CoastToCoast")
    # classes = bnet.classes
    # class_names = {}
    # classes['classes'].each do | c |
    #   class_names[c['id']] = c['name']
    # end
    # bnet.characters(access_token: request.env['onmiauth.auth'].credentials.token)
  end
end
