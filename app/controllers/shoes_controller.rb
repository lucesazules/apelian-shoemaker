class ShoesController < ApplicationController

  before_filter :get_shoe, :only => :show
  before_filter :set_scope, :only => :show

  def index
    campaign_name = params[:campaign].blank?? @current_campaign : params[:campaign]
    @search = Shoe.by_campaign(campaign_name).search(params[:search])
    @shoes = @search.page(params[:page]).per(18)
  end

  def show
    shoes = @scope.all
    @total_shoes = shoes.size
    cur_index = shoes.index(@shoe)
    cur_index = 0 if cur_index.nil?
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
    if params[:scope] == "trend"
      @scope = Shoe.trend.order(:article_number)
    else
      campaign_name = @shoe.campaign
      @search = Shoe.by_campaign(campaign_name).order(:article_number).search(:heel_equals => @shoe.heel)
      @scope = @search
    end
  end

end