task :copy_sizes => :environment do
  OrderDetail.all.each do |od|
    od.update_attribute(:size_id,od.sizes.first.try(:id))
  end
end