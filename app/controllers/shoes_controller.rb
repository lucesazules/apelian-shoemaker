class ShoesController < ApplicationController

  before_filter :get_shoe, :only => :show
  before_filter :set_scope, :only => :show

  def index
    @search = Shoe.order(:article_number).search(params[:search])
    @shoes = @search.page(params[:page]).per(18)
  end

  def show
    shoes = @scope.all
    @total_shoes = shoes.size
    cur_index = shoes.index(@shoe)
    @index = cur_index+1
    @previous_shoe = (cur_index-1 < 0)? nil : shoes[cur_index-1]
    @next_shoe = (cur_index+1 > @total_shoes)? nil : shoes[cur_index+1]
  end

  def trend
    @shoes = Shoe.trend.order(:article_number).page(params[:page]).per(18)
  end

  private
  def get_shoe
    @shoe = Shoe.find(params[:id], :include => [:colors, :sizes])
  end

  def set_scope
    if params[:scope].to_s == 'trend'
      @scope = Shoe.trend
    else
      @search = Shoe.order(:article_number).search(:heel_equals => @shoe.heel)
      @scope = @search
    end
  end

end
