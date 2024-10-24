class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites
  has_many :facilities
  has_many :reviews
  validates :first_name, :last_name, presence: true
  validates :age, presence: true
end
