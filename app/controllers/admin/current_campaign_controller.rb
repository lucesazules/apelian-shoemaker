class Admin::CurrentCampaignController < ApplicationController
  layout false
  def edit
  end

  def update
    a_config = AppConfig.first
    a_config.update_attribute( :current_campaign, params[:campaign])
    redirect_to "/admin"
  end

end
