class AddPhotoToShoe < ActiveRecord::Migration
  def change
    add_column :shoes, :photo_file_name,    :string
    add_column :shoes, :photo_content_type, :string
    add_column :shoes, :photo_file_size,    :integer
    add_column :shoes, :photo_updated_at,   :datetime
  end
end
