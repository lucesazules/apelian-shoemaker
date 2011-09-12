class IndexTables < ActiveRecord::Migration
  def change
    add_index :shoes, :id
    add_index :shoes, :name
  end
end
