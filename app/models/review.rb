class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  validates :comment, :rating, presence: true
  validates :rating, numericality: { in: 0..5 }
  validates :rating, numericality: { only_integer: true }
  validates :comment, length: { minimum: 10 }
end
