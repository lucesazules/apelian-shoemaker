class ShoesController < ApplicationController

  def index
    @search = Shoe.search(params[:search])
    @shoes = @search.page(params[:page]).per(18)
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def trend
    @shoes = Shoe.trend.page(params[:page]).per(18)
  end

end
