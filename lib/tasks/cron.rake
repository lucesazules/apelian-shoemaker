task :cron => :environment do
  # delete orders older than 1.hour
  Order.where("created_at < ?", 1.hour.ago).destroy_all
end