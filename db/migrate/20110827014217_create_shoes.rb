class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.integer :article_number
      t.string  :name
      t.timestamps
    end
  end
end
