class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :published_date, presence: true
end
