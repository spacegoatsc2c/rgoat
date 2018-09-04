require 'bnet'

class UpdateCharactersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    bnet = Battlenet.new(locale: "en_us", api_key: ENV['BNET_API'])
    guild = bnet.guild(realm: "Whisperwind", name: "Space Goats CoastToCoast")
    classes = bnet.classes
    class_names = {}
    classes['classes'].each do | c |
      class_names[c['id']] = c['name']
    end
    guild['members'].each do | member |
      if member['character']['level'] == 120
        character = bnet.character(realm: "Whisperwind", name: member['character']['name'])
        c = Character.find_or_create_by(name: character['name'], realm: character['realm'])
        c.update(ilvl: character['items']['averageItemLevel'],
                 level: character['level'],
                 portrait: bnet.character_image(character: character),
                 class_name: class_names[character['class']])
      end
    end
  end
end
