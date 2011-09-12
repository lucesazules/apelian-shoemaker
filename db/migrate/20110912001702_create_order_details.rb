class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references  :order
      t.references  :shoe
      t.references  :size
      t.references  :color
      t.integer     :quantity
      t.timestamps
    end
  end
end
