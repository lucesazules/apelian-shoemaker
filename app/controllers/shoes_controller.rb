class ShoesController < ApplicationController

  def index
    @search = Shoe.search(params[:search])
    @shoes = @search.page(params[:page]).per(25) # TODO in view put <%= paginate @shoes %>
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def trend
    @shoes = Shoe.all
  end

end
