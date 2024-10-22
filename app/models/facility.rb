class Facility < ApplicationRecord
  has_many :favourites
  has_many :reviews
  has_many :routes
  validates :address, presence: true
  validates :sanitary_products, :business_owner, :baby_change, :quiet_place, :education, inclusion: [true, false]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  search_columns = %i[toilet baby_change education quiet_place sanitary_products]
  pg_search_scope :search_by_everything,
                  against: search_columns,
                  using: {
                    tsearch: { prefix: true }
                  }
  has_one_attached :photo
end
