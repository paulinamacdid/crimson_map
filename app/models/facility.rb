class Facility < ApplicationRecord
  has_many :favourites
  has_many :reviews
  has_many :routes
  validates :address, :business_owner, :sanitary_products, :baby_change, :quiet_place, :education, presence: true
  validates :toilet, presence :true, numericality: { only_integer: true}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
