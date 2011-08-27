class Heel < ActiveRecord::Migration
  def change
    add_column :shoes, :heel, :string
  end
end
