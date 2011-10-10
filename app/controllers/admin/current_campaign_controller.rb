class Admin::CurrentCampaignController < ApplicationController
  layout false
  def edit
  end

  def update
    a_config = YAML.load_file "#{Rails.root}/config/current_campaign.yml"
    a_config["current_campaign"] = params[:campaign]
    File.open("#{Rails.root}/config/current_campaign.yml", 'w') { |f| YAML.dump(a_config, f) }
    redirect_to "/admin"
  end

end
