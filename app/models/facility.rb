class Facility < ApplicationRecord
  has_many :favourites
  has_many :reviews
  has_many :routes
  validates :address, presence: true
  validates :sanitary_products, :business_owner, :baby_change, :quiet_place, :education, inclusion: [true, false]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :toilet, presence: true, numericality: { only_integer: true }
end
