APP_CONFIG = YAML.load_file("#{Rails.root}/config/current_campaign.yml")
CURRENT_CAMPAIGN = APP_CONFIG["current_campaign"]