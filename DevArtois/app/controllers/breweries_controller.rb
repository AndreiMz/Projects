class BreweriesController < ApplicationController
before_action :authenticate_user!
	def index
		@breweries = Brewery.includes(:beers)
	end

	def show
		@brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
	end

	def new
		@brewery = Brewery.new
	end

	def create
    #TODO: add beers to brewery
		@brewery = Brewery.new(brewery_params)
    if @brewery.save
      redirect_to @brewery
    else
      render "new"
    end
	end
	
  def edit
  	@brewery = Brewery.find(params[:id])
  end

	def update
    @brewery = Brewery.find(params[:id])
    if @brewery.update(brewery_params)
      redirect_to brewery_path(@brewery)
    else
      render "new"
    end
	end
	
	def destroy
	  Brewery.find(params[:id]).destroy
    flash[:success] = "Brewery deleted"
    redirect_to breweries_url
	end

	private
	def brewery_params
		params.require(:brewery).permit(:brewery_name, :brewery_latitude,:brewery_longitude, :brewery_website, :brewery_full_address)
	end
end
