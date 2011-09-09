class YearToIntegerForPostre < ActiveRecord::Migration
  def up
    remove_column :shoes, :year
    add_column :shoes, :year, :integer
  end

  def down
    remove_column :shoes, :year
    add_column :shoes, :year, :string
  end
end
