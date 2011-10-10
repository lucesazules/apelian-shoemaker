# encoding: UTF-8
ActiveAdmin::Dashboards.build do

  section "Campaña actual" do
    a_config = YAML.load_file("#{Rails.root}/config/current_campaign.yml")
    @current_campaign = a_config["current_campaign"]
    div do
      li @current_campaign
      li link_to('editar', edit_admin_current_campaign_path)
    end
  end

end
