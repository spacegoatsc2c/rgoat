require 'bnet_api'

class UpdateBossesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    bnet = Battlenet.new(locale: "en_us", api_key: Rails.application.credentials.bnet[:api_key])
    bnet.zones['zones'].each do | zone |
      if zone['isRaid'] == true
        zone['bosses'].each do | boss |
          b = Boss.find_or_create_by(name: boss['name'], zone: zone['name'], patch: zone['patch'])
          boss['npcs'].each do | npc |
            Npc.find_or_create_by(boss: b, image: bnet.boss_image(boss: npc), name: npc['name'])
          end
        end
      end
    end
  end
end
