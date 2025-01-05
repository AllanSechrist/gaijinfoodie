class Restaurant < ApplicationRecord
  has_many :blogs
  belongs_to :user

  enum status: { suggested: 'suggested', visited: 'visited', closed: 'closed' }

  FOOD_RATINGS = ['😋', '😋😋', '😋😋😋', '😋😋😋😋', '😋😋😋😋😋'].freeze
  SERVICE_RATINGS = ['👍', '👍👍', '👍👍👍', '👍👍👍👍', '👍👍👍👍👍'].freeze
  PRICE_RATINGS = ['💸', '💸💸', '💸💸💸', '💸💸💸💸', '💸💸💸💸💸'].freeze

  validates :name, :cuisine, presence: true
  validates :food_rating, inclusion: { in: FOOD_RATINGS }
  validates :service_rating, inclusion: { in: SERVICE_RATINGS }
  validates :price_rating, inclusion: { in: PRICE_RATINGS }
end
