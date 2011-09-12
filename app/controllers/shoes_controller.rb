class ShoesController < ApplicationController

  def index
    @search = Shoe.search(params[:search])
    @shoes = @search.order(:name).page(params[:page]).per(18)
  end

  def show
    @shoe = Shoe.find(params[:id], :include => [:colors, :sizes])
    scope = nil
    if params[:scope].to_s == 'trend'
      scope = Shoe.trend
    else
      @search = Shoe.search(:heel_equals => @shoe.heel)
      scope = @search
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
