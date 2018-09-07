class Rank < ApplicationRecord
  belongs_to :character
  validates :character, presence: true, uniqueness: true
  validates :ilvl, :position, presence: true
end
