class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_campaign

  def set_current_campaign
    a_config = AppConfig.first
    @current_campaign = a_config.current_campaign
  end
end
