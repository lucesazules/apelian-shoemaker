task :cron => :environment do
  Order.destroy_all
end