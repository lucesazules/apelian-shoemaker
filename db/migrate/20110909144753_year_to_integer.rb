class YearToInteger < ActiveRecord::Migration
  def up
    change_column :shoes, :year, :integer
  end

  def down
    change_column :shoes, :year, :string
  end
end
