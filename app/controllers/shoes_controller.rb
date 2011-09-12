class ShoesController < ApplicationController

  before_filter :get_shoe, :only => :show
  before_filter :set_scope, :only => :show

  def index
    @search = Shoe.search(params[:search])
    @shoes = @search.order(:name).page(params[:page]).per(18)
  end

  def show
    @previous_shoe = @shoe.previous_shoe(:article_number, @scope)
    @next_shoe = @shoe.next_shoe(:article_number, @scope)
    @total_shoes = @scope.count
    @index = @scope.where("article_number < ?", @shoe.article_number).count+1
  end

  def trend
    @shoes = Shoe.trend.page(params[:page]).per(18)
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
