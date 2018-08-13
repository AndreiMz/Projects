# frozen_string_literal: true

class BeerStylesController < ApplicationController
  before_action :authenticate_user!
  def index
    @beer_styles = BeerStyle.all
  end

  def edit
    @style = BeerStyle.find(params[:id])
  end

  def update
    @style = BeerStyle.find(params[:id])
    if @style.update(beer_style_params)
      redirect_to beer_style_path(@style)
    else
      render "new"
    end
  end

  def show
    @style = BeerStyle.find(params[:id])
  end

  def new
    @style = BeerStyle.new
  end

  def create
    @style = BeerStyle.new(beer_style_params)
    if @style.save
      redirect_to @style
    else
      render "new"
    end
  end

  def destroy
    BeerStyle.find(params[:id]).destroy
    flash[:success] = "BeerStyle deleted"
    redirect_to beer_styles_url

  end

  private

    def beer_style_params
      params.require(:beer_style).permit(:style_name, :description, :alcohol, :bitterness, :color)
    end
end

