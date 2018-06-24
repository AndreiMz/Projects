class Brewery < ApplicationRecord
	validates :brewery_name, presence: true
	validates :brewery_latitude, presence:true
	validates :brewery_longitude, presence:true
	validates :brewery_website,:url => true, presence:true
	validates :brewery_full_address, presence:true
  has_and_belongs_to_many :beers

  def has_beers
    to_ret = Array.new
    if self.beers.any?
      self.beers.each do |beer|
        to_ret << beer.beer_name
      end
    else
      to_ret<<"NOPE"
    end
    return to_ret
  end
end
