class Character < ApplicationRecord
  has_many :Youtubes
  validates :name, uniqueness: { scope: :realm }
end
