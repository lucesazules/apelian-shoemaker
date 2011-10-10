# encoding: UTF-8
ActiveAdmin::Dashboards.build do

  section "Campaña actual" do
    @current_campaign = AppConfig.first.current_campaign
    div do
      li @current_campaign
      li link_to('editar', edit_admin_current_campaign_path)
    end
  end

end
