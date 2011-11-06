class AddIndexes < ActiveRecord::Migration
  def change
    add_index :app_configs, :id
    add_index :colors, :id
  end
end
