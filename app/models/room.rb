class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user
  has_one_attached :image
end
