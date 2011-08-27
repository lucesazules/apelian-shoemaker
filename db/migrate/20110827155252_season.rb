class Season < ActiveRecord::Migration
  def change
    add_column :shoes, :year, :string
    add_column :shoes, :season_name, :string
  end
end
