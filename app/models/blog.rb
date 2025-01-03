class Blog < ApplicationRecord
  belongs_to :restaurant
  validates :title, presence: true
  validates :content, presence: true
  validates :published_date, presence: true

  def like!
    increment!(:likes)
  end
end
