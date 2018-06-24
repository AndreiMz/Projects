class WelcomeController < ApplicationController
  def index
    my_breweries = Brewery.includes(:beers) #get all the breweries from db
    breweries_hashes = Array.new  #create a new array in which we will store breweries as hashes

    my_breweries.each do |br| #append through all breweries
      temp = br.attributes #attributes returns the brewery in hash format, as it's easier to add a field this way

      beer_names = br.beers.map { |n| n.beer_name } #get the beers found in this brewery and store the names in an array
      temp["beers"] = beer_names #add the beers key to the temporary hash, which contains the array of beer names

      breweries_hashes.append(temp) #append the temporary hash to the array of hashes
    end

    @json_breweries = breweries_hashes.to_json() #convert to json the array of hashes and put it in an instance variable to use in the view
    
  end

  def autocomplete    
    breweries = Brewery.includes(:beers).all.map do |brewery|
      {
        id: brewery.id,
        name: brewery.brewery_name, 
        beers: brewery.beers.pluck(:beer_name).join(",") ,
        styles: brewery.beers.map {|b| b.beer_style.style_name}.uniq.join(",")
      }
    end

    render json: breweries
  end

end
