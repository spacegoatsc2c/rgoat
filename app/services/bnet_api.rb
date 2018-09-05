class Battlenet
  include HTTParty
  base_uri 'https://us.api.battle.net'

  def initialize(locale:, api_key:)
    @options = { query: { locale: locale, apiKey: api_key } }
  end

  def guild(realm:, name:)
    options = {query: @options[:query].merge({fields: 'members'})}
    name = URI.escape(name)
    self.class.get("/wow/guild/#{realm}/#{name}", options)
  end

  def character(realm:, name:)
    options = {query: @options[:query].merge({fields: 'items'})}
    self.class.get("/wow/character/#{realm}/#{name}", options)
  end

  def characters(access_token:)
    options = {query: {access_token: access_token}}
    self.class.get("/wow/user/characters", options)
  end

  def zones
    self.class.get("/wow/zone/", @options)
  end

  def classes
    self.class.get("/wow/data/character/classes", @options)
  end

  def boss_image(boss:)
    image_id = boss['creatureDisplayId']
    "https://render-us.worldofwarcraft.com/npcs/zoom/creature-display-#{image_id}.jpg"
  end

  def character_image(character:)
    thumbnail = character['thumbnail']
    "https://render-us.worldofwarcraft.com/character/#{thumbnail}"
  end
end
