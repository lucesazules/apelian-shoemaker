task :cron => :environment do
  Order.where("created_at < ?", 1.hour.ago).destroy_all
end