class Blog < ApplicationRecord
  belongs_to :restaurant
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

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
