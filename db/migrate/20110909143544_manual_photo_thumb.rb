class ManualPhotoThumb < ActiveRecord::Migration
  def change
    add_column :shoes, :photo_manual_thumb_file_name,    :string
    add_column :shoes, :photo_manual_thumb_content_type, :string
    add_column :shoes, :photo_manual_thumb_file_size,    :integer
    add_column :shoes, :photo_manual_thumb_updated_at,   :datetime
  end

end
