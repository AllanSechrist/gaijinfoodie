class Blog < ApplicationRecord
  belongs_to :restaurant
  FOOD_RATINGS = ['😋', '😋😋', '😋😋😋', '😋😋😋😋', '😋😋😋😋😋'].freeze
  SERVICE_RATINGS = ['👍', '👍👍', '👍👍👍', '👍👍👍👍', '👍👍👍👍👍'].freeze
  PRICE_RATINGS = ['💸', '💸💸', '💸💸💸', '💸💸💸💸', '💸💸💸💸💸'].freeze
  validates :title, presence: true
  validates :content, presence: true
  validates :published_date, presence: true
  validates :food_rating, inclusion: { in: FOOD_RATINGS }
  validates :service_rating, inclusion: { in: SERVICE_RATINGS }
  validates :price_rating, inclusion: { in: PRICE_RATINGS }

  def like!
    increment!(:likes)
  end
end
