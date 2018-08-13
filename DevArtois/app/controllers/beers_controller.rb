require 'net/http'
require 'open-uri'

class BeersController < ApplicationController
  before_action :authenticate_user!
  def check_image(url)
    if url == ""
      return false
    end
    uri = URI.parse(url)
    begin
      Net::HTTP.start(uri.host, uri.port) do |http|
        return http.head(uri.request_uri)['Content-Type'].start_with? 'image'
      end
    rescue
      return false
    end
  end

  def index
    @beers = Beer.all
  end

  def edit
    @beer = Beer.find(params[:id])
    @breweries = Brewery.all
    @styles = BeerStyle.all
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(beer_params.except(:breweries))

    sent_ids = Array.new

    if !beer_params[:breweries].nil?
      sent_ids = beer_params[:breweries].map {|x| x.to_i}
    end

    current_ids = @beer.breweries.pluck(:id)


    (sent_ids-current_ids).each do |elem|
      @beer.breweries.append(Brewery.find(elem))
    end

    (current_ids-sent_ids).each do |elem|
      @beer.breweries.delete(Brewery.find(elem))
    end

    redirect_to beer_path(@beer)
  end

  def show
    @beer = Beer.find(params[:id])
    @breweries = @beer.breweries
  end

  def new
    @beer = Beer.new   
    @beer_styles = BeerStyle.all
    @breweries = Brewery.all
  end

  def create
    @beer_styles = BeerStyle.all
    @breweries = Brewery.all
    
    @beer = Beer.new(beer_params.except(:breweries))
    if !check_image(beer_params[:photo])
      @beer.photo = "/beer-placeholder.png"
    end

    if !beer_params[:breweries].nil? 
      beer_params[:breweries].each do |brewery|
        @beer.breweries.append(Brewery.find(brewery))
      end
    end
       
    if @beer.save
      redirect_to @beer
    else
      render "new"
    end
  end

  def destroy
    Beer.find(params[:id]).destroy
    flash[:success] = "Beer deleted"
    redirect_to beers_url
  end

  private 
    def beer_params
      params.require(:beer).permit(:beer_name, :photo, :description,:beer_style_id,breweries: [] )
    end
    
end
