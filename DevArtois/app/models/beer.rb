class Beer < ApplicationRecord
  validates :beer_name, presence: true
  validates :description, presence: true
  validates_uniqueness_of :beer_name
  belongs_to :beer_style
  has_and_belongs_to_many :breweries
end
