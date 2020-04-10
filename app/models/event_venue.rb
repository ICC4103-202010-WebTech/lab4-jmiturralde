class EventVenue < ApplicationRecord
  validates :name, :address, presence:true
  validates :capacity, length: { minimum: 2 }, numericality: { only_integer: true }
  has_many :events
end
