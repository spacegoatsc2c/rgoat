require 'HTTParty'

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

def print_character_ilevels(bnet)
  guild = bnet.guild(realm: "Whisperwind", name: "Space Goats CoastToCoast")
  classes = bnet.classes
  class_names = {}
  classes['classes'].each do | c |
    class_names[c['id']] = c['name']
  end
  guild['members'].each do | member |
    if member['character']['level'] == 120
      character = bnet.character(realm: "Whisperwind", name: member['character']['name'])
      puts "#{character['name']}: #{character['items']['averageItemLevel']}"
      puts "  " + class_names[character['class']]
      puts "  " + bnet.character_image(character: character)
    end
  end
end

def print_all_bosses(bnet)
  bnet.zones['zones'].each do | zone |
    if zone['isRaid'] == true
      puts zone['name']
      zone['bosses'].each do | boss |
        puts "  " + boss['name']
        boss['npcs'].each do | npc |
          puts "    #{npc['name']} - #{bnet.boss_image(boss: npc)}"
        end
      end
    end
  end
end

unless ENV['BNET_API']
  puts "missing BNET_API environment variable"
  exit
end
bnet = Battlenet.new(locale: "en_us", api_key: ENV['BNET_API'])
print_character_ilevels bnet
print_all_bosses bnet
