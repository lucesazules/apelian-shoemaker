class CreateShoesSizes < ActiveRecord::Migration
  def change
    create_table :shoes_sizes do |t|
      t.references :shoe
      t.references :size
    end
  end
end
