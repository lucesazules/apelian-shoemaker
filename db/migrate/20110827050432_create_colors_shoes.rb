class CreateColorsShoes < ActiveRecord::Migration
  def change
    create_table :colors_shoes do |t|
      t.references :color
      t.references :shoe
    end
  end
end
