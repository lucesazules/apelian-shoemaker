class ShoesController < ApplicationController

  def index
    @search = Shoe.search(params[:search])
    @shoes = @search.order(:name).page(params[:page]).per(18)
  end

  def show
    @shoe = Shoe.find(params[:id])
    if params[:scope].to_s == 'trend'
      scope = Shoe.trend
    else
      scope = Shoe.where(:heel => @shoe.heel)
    end
    @previous_shoe = @shoe.previous_shoe(:name, scope)
    @next_shoe = @shoe.next_shoe(:name, scope)
    @total_shoes = scope.count
    @index = scope.where("name < ?", @shoe.name).count+1
  end

  def trend
    @shoes = Shoe.trend.page(params[:page]).per(18)
  end

end
