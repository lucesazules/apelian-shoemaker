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
    @previous_shoe = @shoe.previous_shoe(:article_number, scope)
    @next_shoe = @shoe.next_shoe(:article_number, scope)
    @total_shoes = scope.count
    @index = scope.where("article_number < ?", @shoe.article_number).count+1
  end

  def trend
    @shoes = Shoe.trend.page(params[:page]).per(18)
  end

end
