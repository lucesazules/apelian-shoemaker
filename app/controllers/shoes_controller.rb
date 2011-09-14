class ShoesController < ApplicationController

  before_filter :get_shoe, :only => :show
  before_filter :set_scope, :only => :show

  def index
    @search = Shoe.order(:article_number).search(params[:search])
    @shoes = @search.page(params[:page]).per(18)
  end

  def show
    shoes = @scope.order(:article_number).all
    @total_shoes = shoes.size
    @index = shoes.index(@shoe)+1
    @previous_shoe = shoes[@index-2] unless @index-2 < 0
    @next_shoe = shoes[@index+1] unless @index+1 > @total_shoes
  end

  def trend
    @shoes = Shoe.trend.order(:article_number).page(params[:page]).per(18)
  end

  private
  def get_shoe
    @shoe = Shoe.find(params[:id], :include => [:colors, :sizes])
  end

  private
  def set_scope
    if params[:scope].to_s == 'trend'
      @scope = Shoe.trend
    else
      @search = Shoe.search(:heel_equals => @shoe.heel)
      @scope = @search
    end
  end

end
