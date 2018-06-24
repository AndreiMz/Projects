class BeerStyle < ApplicationRecord
  validates :style_name, presence: true
  validates :alcohol, numericality: true, presence: true
  validates :bitterness, numericality: true, presence: true
  validates :color, numericality: true, presence: true
  has_many :beers
end
