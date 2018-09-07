class Character < ApplicationRecord
  class NoRank
    def position
      Character.count
    end

    def ilvl
      0
    end
  end

  has_many :youtubes
  validates :name, uniqueness: { scope: :realm }
  has_one :rank

  def ilvl_change
    ilvl - rank.ilvl
  end

  def rank
    super || NoRank.new
  end
end
