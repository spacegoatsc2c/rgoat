class UpdateRanksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rank.delete_all
    max_level = Character.maximum(:level)
    Character.where(level: max_level).order(ilvl: :desc).each_with_index do | character, index |
      Rank.create(character: character, ilvl: character.ilvl, position: index)
    end
  end
end
