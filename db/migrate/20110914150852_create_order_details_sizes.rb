class CreateOrderDetailsSizes < ActiveRecord::Migration
  def change
    create_table :order_details_sizes do |t|
      t.references :order_detail
      t.references :size
    end
  end
end
