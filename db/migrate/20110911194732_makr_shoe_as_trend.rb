class MakrShoeAsTrend < ActiveRecord::Migration
  def change
    add_column :shoes, :trend, :boolean
  end
end
