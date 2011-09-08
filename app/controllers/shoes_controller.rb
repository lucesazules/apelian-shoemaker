class ShoesController < ApplicationController

  def index
    @search = Shoe.search(params[:search])
    @shoes = @search.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def trend
    @shoes = Shoe.all
  end

end
