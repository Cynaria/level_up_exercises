class Performer < ActiveRecord::Base
  has_and_belongs_to_many :shows
  has_many :performances, through: :shows

  validates :name, presence: true
  validates :description, presence: true

  def average_rating
    performances.includes(:reviews).average(:rating)
  end
end
