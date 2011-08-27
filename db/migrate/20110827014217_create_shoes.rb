class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|

      t.timestamps
    end
  end
end
