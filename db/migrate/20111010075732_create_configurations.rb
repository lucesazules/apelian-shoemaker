class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :current_campaign
      t.timestamps
    end
  end
end
